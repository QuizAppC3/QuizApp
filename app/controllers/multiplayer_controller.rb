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

    # Stelle sicher, dass nur der Host das Spiel starten kann
    unless @game.user == current_user
      redirect_to multiplayer_waiting_path(code: @game.code), alert: "Nur der Host kann das Spiel starten."
      return
    end

    Turbo::StreamsChannel.broadcast_update_to( 
      "game_#{@game.id}_players", 
      target: "body", 
  

      partial: "multiplayer/redirect_to_question", 
      locals: { question_path: multiplayer_question_path(code: @game.code) }
    )

    redirect_to multiplayer_question_path(code: @game.code)
  end

  def question
    @game = Game.find_by(code: params[:code])
    @question = Question.order("RANDOM()").first
  end

  def answer
    game = Game.find_by(code: params[:code])
    @question = Question.find(params[:question_id])

    player = game.game_players.find_by(user: current_user)

    if params[:selected_answer] == @question.korrekt
      player.update(score: player.score + 10)
      flash[:notice] = "Richtig!"
    else
      flash[:alert] = "Falsch! Richtige Antwort: #{@question.korrekt}"
    end

    redirect_to multiplayer_question_path(code: game.code)
  end

  def results
    game = Game.find_by(code: params[:code])
    @players = game.game_players.includes(:user).order(score: :desc)
  end
end
