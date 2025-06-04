require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest
  # Explizites Einbinden der Routen-Helper für Integrationstests
  include Rails.application.routes.url_helpers

  setup do
    @user = create(:user)
    sign_in @user # Authentifiziert den Benutzer für den Start jedes Tests
  end

  test "should get index and load a random question" do
    create(:question) # Sicherstellen, dass mindestens eine Frage existiert
    get game_url # Entspricht: get 'game', to: 'game#index'
    assert_response :success
    assert_not_nil assigns(:question), "Eine Frage sollte @question zugewiesen sein"
  end
end