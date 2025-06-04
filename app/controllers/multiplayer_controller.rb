class MultiplayerController < ApplicationController
  before_action :authenticate_user!

  def lobby
    # Spiel erstellen mit zufälligem Code
    code = loop do
      random = SecureRandom.hex(3)
      break random unless Game.exists?(code: random)
    end

    game = current_user.games.create!(code: code, active: true)
    GamePlayer.create!(game: game, user: current_user, score: 0)

    redirect_to multiplayer_waiting_path(code: game.code)
  end

  def waiting
    @game = Game.find_by(code: params[:code])
    @players = @game.game_players.includes(:user)
  end

  

  def join_form
end

def join_game
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
  @game = Game.find_by(code: params[:code])
  question_ids = JSON.parse(@game.questions_order || '[]')
  current_index = @game.current_question_index || 0

  if current_index >= question_ids.size
    redirect_to multiplayer_results_path(code: @game.code) and return
  end

  @question = Question.find(question_ids[current_index])

  # Kein HTML rendern – ggf. redirecten oder einfach "no content"
  head :no_content
end


  def answer
  @game = Game.find_by(code: params[:code])
  question_ids = JSON.parse(@game.questions_order || '[]')
  current_index = @game.current_question_index || 0
  @question = Question.find(params[:question_id])
  player = @game.game_players.find_by(user: current_user)

  if params[:selected_answer] == @question.korrekt
    player.increment!(:score, 10)
    flash[:notice] = "Richtig!"
  else
    flash[:alert] = "Falsch! Richtige Antwort: #{@question.korrekt}"
  end

  # Nächste Frage vorbereiten
  next_index = current_index + 1

  if next_index >= question_ids.size
    # Spiel beenden
    @game.update(active: false)
    Turbo::StreamsChannel.broadcast_replace_to(
      "game_#{@game.id}_players",
      target: "game_content",
      partial: "multiplayer/results",
      locals: { game: @game, players: @game.game_players.includes(:user).order(score: :desc) }
    )

    redirect_to multiplayer_results_path(code: @game.code) and return
  else
    # Index speichern & nächste Frage holen
    @game.update(current_question_index: next_index)
    next_question = Question.find(question_ids[next_index])

    # An alle broadcasten, damit alle Spieler die nächste Frage sehen
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
  @game = Game.find_by(code: params[:code])
  @players = @game.game_players.includes(:user).order(score: :desc)
end

end
