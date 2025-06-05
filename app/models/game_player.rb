# app/models/game_player.rb
class GamePlayer < ApplicationRecord
  belongs_to :game
  belongs_to :user

  after_create_commit -> {
    broadcast_replace_to(
      "lobby_#{game.code}",
      target: "lobby",
      partial: "multiplayer/player_list",
      locals: { players: game.game_players.includes(:user) }
    )
  }
end
