class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
    @games = @user.games.order(created_at: :desc)
  end
end
