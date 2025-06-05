class GameController < ApplicationController
  before_action :authenticate_user!

 def index
  if session[:current_question_id]
    @question = Question.find_by(id: session[:current_question_id])
  end
end


  def start
    mode = params[:mode] || 'single'
    session[:total_questions] = params[:total_questions].to_i
    session[:question_counter] = 0
    session[:score] = 0
    session[:asked_questions] = []

   if mode == 'multi'
    # Multiplayer: Erstelle Game mit Code & Host (current_user)
    code = SecureRandom.hex(3).upcase  # z.B. 6-stelliger Code
    @game = current_user.games.create!(score: 0, active: true, code: code, host: current_user)
    session[:game_id] = @game.id
    redirect_to multiplayer_waiting_path(code: code) # Lobby anzeigen
  else
  @game = current_user.games.create!(score: 0, active: true, host: current_user)
  session[:game_id] = @game.id
  redirect_to categories_path
    end
end

  def next_question
    session[:question_counter] ||= 0
    session[:asked_questions] ||= []

    # Zuerst prüfen, ob das Spiel beendet ist
    if session[:question_counter] >= session[:total_questions]
      redirect_to game_result_path
      return
    end

    asked_ids = session[:asked_questions] || []
    selected_categories = session[:selected_categories]

    if selected_categories.present?
      @question = Question.where.not(id: asked_ids)
                          .where(kategorie: selected_categories)
                          .order("RANDOM()")
                          .first
    else
      @question = Question.where.not(id: asked_ids).order("RANDOM()").first
    end
    session[:current_question_id] = @question.id

    if @question
      session[:asked_questions] << @question.id
      @answered = false
      session[:question_counter] += 1
      redirect_to game_path 
    else
      flash[:alert] = "Nicht genügend Fragen verfügbar."
      redirect_to game_result_path
    end
  end

  def answer
    @question = Question.find(params[:question_id])
    @answered = true # Dies ist für die Ansicht, um den "Weiter"-Button anzuzeigen

    if params[:selected_answer] == @question.korrekt
      flash[:notice] = "Richtig!"
      session[:score] ||= 0
      session[:score] += 10
    else
      flash[:alert] = "Falsch! Richtige Antwort: #{@question.korrekt}"
    end

    # aktuelles Game-Objekt aktualisieren
    if session[:game_id]
      game = current_user.games.find_by(id: session[:game_id])
      game.update(score: session[:score]) if game
    end
      session.delete(:current_question_id)

    redirect_to game_path(answered: true)
  end

  def result
    @game = current_user.games.find_by(id: session[:game_id])

    if @game
      @game.update(active: false)
    end
  end

  private

end