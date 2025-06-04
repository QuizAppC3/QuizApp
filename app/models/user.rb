class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Füge Validierungen für das 'username'-Feld hinzu
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :username, length: { minimum: 3, maximum: 50 } # Beispiel: Mindest- und Maximallänge

  # Optional: Wenn du möchtest, dass der Username nur Buchstaben, Zahlen und Unterstriche enthält
  # validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, :multiline => true


  # Assoziationen basierend auf deinem Schema (falls noch nicht vorhanden)
  has_many :game_players
  has_many :games # als Spieler
  has_many :hosted_games, class_name: 'Game', foreign_key: 'host_id' # als Host
  has_many :tasks

end