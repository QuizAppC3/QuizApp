class GameController < ApplicationController

  def index
    load_random_question
  end

def start
  session[:total_questions] = params[:total_questions].to_i
  session[:question_counter] = 0
  session[:score] = 0
  session[:asked_questions] = []
  @game = Game.create(score: 0, active: true)
  redirect_to game_path
end


def next_question
  session[:question_counter] ||= 0
  session[:question_counter] += 1

  if session[:question_counter] == session[:total_questions]
    redirect_to game_result_path
    return
  end

  asked_ids = session[:asked_questions] || []
  selected_categories = session[:selected_categories]
  @question = Question.where.not(id: asked_ids).order("RANDOM()").first

  if selected_categories.present?
    @question = Question.where.not(id: asked_ids)
                        .where(kategorie: selected_categories)
                        .order("RANDOM()")
                        .first
  else
    @question = Question.where.not(id: asked_ids).order("RANDOM()").first
  end

  if @question
    session[:asked_questions] << @question.id
    @answered = false
    render :index
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
    Game.last.update(score: session[:score])
  else
    flash[:alert] = "Falsch! Richtige Antwort: #{@question.korrekt}"
  end

  redirect_to game_path(answered: true)  # optional redirect
end


    def result
        @game = Game.last
    end

  private

  def load_random_question
    @question = Question.order("RANDOM()").first
    session[:score] ||= 0
  end
end
