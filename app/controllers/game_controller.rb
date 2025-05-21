class GameController < ApplicationController
    before_action :authenticate_user!

  def index
    load_random_question
  end

def start
  session[:total_questions] = params[:total_questions].to_i
  session[:question_counter] = 0
  session[:score] = 0
  session[:asked_questions] = []

  @game = current_user.games.create!(score: 0, active: true)  # <- wichtig
  session[:game_id] = @game.id

  redirect_to categories_path
end



def next_question
  session[:question_counter] ||= 0
  session[:asked_questions] ||= []
  asked_ids = session[:asked_questions]
  selected_categories = session[:selected_categories]

  if session[:question_counter] >= session[:total_questions]
    redirect_to game_result_path and return
  end

  @question = if selected_categories.present?
    Question.where.not(id: asked_ids)
            .where(kategorie: selected_categories)
            .order("RANDOM()")
            .first
  else
    Question.where.not(id: asked_ids).order("RANDOM()").first
  end

  if @question
    session[:asked_questions] << @question.id
    session[:question_counter] += 1
    redirect_to game_path(answered: false)
  else
    flash[:alert] = "Nicht genügend Fragen verfügbar."
    redirect_to game_result_path
  end
end

def answer
  @question = Question.find(params[:question_id])
  @answered = true

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

  redirect_to game_path(answered: true)
end



def result
  @game = current_user.games.find_by(id: session[:game_id])

  if @game
    @game.update(active: false)
  end
end


  private

  def load_random_question
    @question = Question.order("RANDOM()").first
    session[:score] ||= 0
  end
end
