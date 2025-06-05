class MultiplayerController < ApplicationController
  # Stellt sicher, dass der Benutzer vor dem Zugriff auf diese Aktionen angemeldet ist.
  before_action :authenticate_user!

  def lobby
    # Erstellt ein neues Multiplayer-Spiel mit einem einzigartigen, zufälligen Code.
    # Fügt den aktuellen Benutzer als ersten Spieler zum Spiel hinzu und leitet zur Warte-Lobby um.
    code = loop do
      random = SecureRandom.hex(3)
      break random unless Game.exists?(code: random)
    end

    game = current_user.games.create!(code: code, active: true)
    GamePlayer.create!(game: game, user: current_user, score: 0)

    redirect_to multiplayer_waiting_path(code: game.code)
  end

  def waiting
    # Zeigt die Warte-Lobby für ein bestimmtes Spiel an, identifiziert durch den Code.
    # Listet alle Spieler auf, die dem Spiel beigetreten sind.
    @game = Game.find_by(code: params[:code])
    @players = @game.game_players.includes(:user)
  end

  def join_form
    # Rendert das Formular, über das Spieler einen Spiel-Code eingeben können, um einem Spiel beizutreten.
  end

  def join_game
    # Verarbeitet den Beitritt eines Spielers zu einem bestehenden Spiel.
    # Findet oder erstellt einen "GamePlayer"-Eintrag für den aktuellen Benutzer im Spiel.
    # Aktualisiert die Spielerliste in der Warte-Lobby für alle über Turbo Streams.
    game = Game.find_by(code: params[:code])
    # Spieler anlegen, falls nicht da
    player = game.game_players.find_or_create_by(user: current_user)

    # Broadcast aktualisieren
    Turbo::StreamsChannel.broadcast_replace_to(
      "game_#{game.id}_players",
      target: "player_list",
      partial: "multiplayer/player_list",
      locals: { players: game.game_players.includes(:user) }
    )

    redirect_to multiplayer_waiting_path(code: game.code)
  end

  def start_game
    # Startet das Multiplayer-Spiel. Dies ist nur dem Host erlaubt.
    # Wählt Fragen basierend auf Kategorien und Anzahl aus, speichert deren Reihenfolge im Spiel.
    # Leitet alle Spieler zur ersten Frage weiter, indem der Inhalt per Turbo Streams aktualisiert wird.
    @game = Game.find_by(code: params[:code])

    unless @game.user == current_user
      redirect_to multiplayer_waiting_path(code: @game.code), alert: "Nur der Host kann das Spiel starten."
      return
    end

    # Kategorien und Anzahl z.B. aus Parametern oder aus der Lobby (hier hardcoded für Beispiel)
    selected_categories = params[:categories] || ['all']
    total_questions = (params[:total_questions] || 10).to_i

    # Fragen auswählen
    if selected_categories.include?('all')
      questions = Question.order("RANDOM()").limit(total_questions)
    else
      questions = Question.where(kategorie: selected_categories).order("RANDOM()").limit(total_questions)
    end

    # Reihenfolge in Game speichern (JSON-Array)
    @game.update!(
      questions_order: questions.pluck(:id).to_json,
      current_question_index: 0,
      active: true
    )

    # Broadcast an alle Spieler: Spiel beginnt und erste Frage laden
    Turbo::StreamsChannel.broadcast_replace_to(
      "game_#{@game.id}_players",
      target: "game_content",
      partial: "multiplayer/question",
      locals: { game: @game, question: questions.first }
    )

    # Host weiterleiten (optional)
    redirect_to multiplayer_question_path(code: @game.code)
  end

  def question
    # Zeigt die aktuelle Frage des Multiplayer-Spiels an.
    # Holt die Frage basierend auf dem aktuellen Fragenindex aus der gespeicherten Reihenfolge des Spiels.
    # Leitet zu den Ergebnissen um, wenn alle Fragen beantwortet wurden.
    @game = Game.find_by(code: params[:code])
    question_ids = JSON.parse(@game.questions_order || '[]')
    current_index = @game.current_question_index || 0

    if current_index >= question_ids.size
      redirect_to multiplayer_results_path(code: @game.code) and return
    end

    @question = Question.find(question_ids[current_index])

    # Rendert das Template für die Frage.
    render "multiplayer/question", locals: { game: @game, question: @question }
  end

  def answer
    # Verarbeitet die Antwort eines Spielers auf eine Frage im Multiplayer-Spiel.
    # Überprüft die Antwort, aktualisiert den Punktestand des Spielers.
    # Geht zur nächsten Frage über oder beendet das Spiel und aktualisiert alle Spieler per Turbo Streams.
    @game = Game.find_by(code: params[:code])
    question_ids = JSON.parse(@game.questions_order || '[]')
    current_index = @game.current_question_index || 0
    @question = Question.find(params[:question_id])
    player = @game.game_players.find_by(user: current_user)

    if params[:selected_answer] == @question.korrekt
      player.increment!(:score, 10) # Erhöht die Punktzahl des Spielers bei richtiger Antwort.
      flash[:notice] = "Richtig!"
    else
      flash[:alert] = "Falsch! Richtige Antwort: #{@question.korrekt}"
    end

    # Nächste Frage vorbereiten
    next_index = current_index + 1

    if next_index >= question_ids.size
      # Spiel beenden, wenn alle Fragen beantwortet sind.
      @game.update(active: false)
      # Sendet die Spielergebnisse an alle Spieler.
      Turbo::StreamsChannel.broadcast_replace_to(
        "game_#{@game.id}_players",
        target: "game_content",
        partial: "multiplayer/results",
        locals: { game: @game, players: @game.game_players.includes(:user).order(score: :desc) }
      )

      redirect_to multiplayer_results_path(code: @game.code) and return
    else
      # Aktualisiert den Fragenindex und holt die nächste Frage.
      @game.update(current_question_index: next_index)
      next_question = Question.find(question_ids[next_index])

      # Sendet die nächste Frage an alle Spieler.
      Turbo::StreamsChannel.broadcast_replace_to(
        "game_#{@game.id}_players",
        target: "game_content",
        partial: "multiplayer/question",
        locals: { game: @game, question: next_question }
      )

      redirect_to multiplayer_question_path(code: @game.code) and return
    end
  end

  def results
    # Zeigt die Endergebnisse eines Multiplayer-Spiels an.
    # Holt das Spiel und sortiert die Spieler nach ihrer Punktzahl, um die Rangliste darzustellen.
    @game = Game.find_by(code: params[:code])
    @players = @game.game_players.includes(:user).order(score: :desc)
  end
end