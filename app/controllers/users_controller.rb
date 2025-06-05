class UsersController < ApplicationController
  # Stellt sicher, dass der Benutzer vor dem Zugriff auf diese Aktionen angemeldet ist.
  before_action :authenticate_user!

  def profile
    # Zeigt das Profil des aktuell angemeldeten Benutzers an.
    # Holt den aktuellen Benutzer und alle Spiele, die dieser Benutzer erstellt hat,
    # sortiert nach dem Erstellungsdatum absteigend.
    @user = current_user
    @games = @user.games.order(created_at: :desc)
  end
end