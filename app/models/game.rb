class Game < ApplicationRecord
  belongs_to :user
  belongs_to :host, class_name: "User", optional: true # optional wegen Singleplayer

  validates :code, uniqueness: true, allow_nil: true
  validates :host, presence: true, if: -> { code.present? }

  has_many :game_players
  has_many :players, through: :game_players, source: :user

  # falls du noch eine belongs_to host Beziehung hast
  belongs_to :host, class_name: 'User'
end
