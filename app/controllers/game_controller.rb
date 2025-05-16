class GameController < ApplicationController

  def index
    load_random_question
  end

def start
  @game = Game.create(score: 0, active: true)
  session[:question_count] = 0
  redirect_to game_path
end

  def next_question
  session[:question_counter] ||= 0
  session[:question_counter] += 1

  if session[:question_counter] > 10
    redirect_to game_result_path
  else
    @question = Question.order("RANDOM()").first
    @answered = false
    render :index
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
