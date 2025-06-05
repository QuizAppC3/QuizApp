class GameController < ApplicationController
  # Stellt sicher, dass der Benutzer vor dem Zugriff auf diese Aktionen angemeldet ist.
  before_action :authenticate_user!

  def index
    # Zeigt die aktuelle Frage an, falls eine in der Session gespeichert ist.
    if session[:current_question_id]
      @question = Question.find_by(id: session[:current_question_id])
    end
  end

  def start
    # Initialisiert eine neue Spielsession und setzt den Spielmodus (Einzel- oder Mehrspieler).
    # Erstellt ein neues Spielobjekt und leitet je nach Modus um.
    mode = params[:mode] || 'single'
    session[:total_questions] = params[:total_questions].to_i
    session[:question_counter] = 0
    session[:score] = 0
    session[:asked_questions] = []

    if mode == 'multi'
      # Für den Mehrspielermodus: Erstellt ein Spiel mit einem zufälligen Code und setzt den aktuellen Benutzer als Host.
      code = SecureRandom.hex(3).upcase # z.B. 6-stelliger Code
      @game = current_user.games.create!(score: 0, active: true, code: code, host: current_user)
      session[:game_id] = @game.id
      redirect_to multiplayer_waiting_path(code: code) # Leitet zur Mehrspieler-Lobby um.
    else
      # Für den Einzelspielermodus: Erstellt ein Spiel für den aktuellen Benutzer.
      @game = current_user.games.create!(score: 0, active: true, host: current_user)
      session[:game_id] = @game.id
      redirect_to categories_path # Leitet zur Kategorienauswahl um.
    end
  end

  def next_question
    # Verwaltet das Abrufen der nächsten Frage im Spiel.
    # Prüft, ob die maximale Anzahl an Fragen erreicht ist, und wählt eine neue Frage aus den verbleibenden aus.
    session[:question_counter] ||= 0
    session[:asked_questions] ||= []

    # Zuerst prüfen, ob das Spiel beendet ist (alle Fragen gestellt).
    if session[:question_counter] >= session[:total_questions]
      redirect_to game_result_path
      return
    end

    asked_ids = session[:asked_questions] || []
    selected_categories = session[:selected_categories]

    # Wählt eine zufällige Frage aus, die noch nicht gestellt wurde und zu den ausgewählten Kategorien gehört.
    if selected_categories.present?
      @question = Question.where.not(id: asked_ids)
                          .where(kategorie: selected_categories)
                          .order("RANDOM()")
                          .first
    else
      # Wenn keine Kategorien ausgewählt sind, wählt eine zufällige Frage ohne Kategorie-Filter aus.
      @question = Question.where.not(id: asked_ids).order("RANDOM()").first
    end
    session[:current_question_id] = @question.id

    if @question
      # Fügt die aktuelle Frage zur Liste der gestellten Fragen hinzu und erhöht den Fragenzähler.
      session[:asked_questions] << @question.id
      @answered = false
      session[:question_counter] += 1
      redirect_to game_path # Leitet zur Spielseite mit der neuen Frage um.
    else
      # Falls keine weiteren Fragen verfügbar sind, wird das Spiel beendet.
      flash[:alert] = "Nicht genügend Fragen verfügbar."
      redirect_to game_result_path
    end
  end

  def answer
    # Verarbeitet die vom Benutzer gegebene Antwort auf eine Frage.
    # Überprüft die Antwort, aktualisiert die Punktzahl des Spielers und das Spielobjekt.
    @question = Question.find(params[:question_id])
    @answered = true # Dies ist für die Ansicht, um den "Weiter"-Button anzuzeigen

    if params[:selected_answer] == @question.korrekt
      flash[:notice] = "Richtig!"
      session[:score] ||= 0
      session[:score] += 10 # Erhöht die Punktzahl bei richtiger Antwort.
    else
      flash[:alert] = "Falsch! Richtige Antwort: #{@question.korrekt}" # Gibt die richtige Antwort aus.
    end

    # Aktualisiert den Punktestand des aktuellen Spiels in der Datenbank.
    if session[:game_id]
      game = current_user.games.find_by(id: session[:game_id])
      game.update(score: session[:score]) if game
    end
      session.delete(:current_question_id) # Entfernt die aktuelle Frage aus der Session.

    redirect_to game_path(answered: true) # Leitet zurück zur Spielseite und zeigt den "Weiter"-Button.
  end

  def result
    # Zeigt das Endergebnis des Spiels an und markiert das Spiel als inaktiv.
    @game = current_user.games.find_by(id: session[:game_id])

    if @game
      @game.update(active: false) # Setzt das Spiel auf inaktiv, wenn es beendet ist.
    end
  end

  private

end