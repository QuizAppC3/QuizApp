# test/models/game_test.rb
require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "should be a valid game with valid attributes from factory" do
    # Erstellt ein Game-Objekt über Factory Bot.
    # Die Factory sorgt automatisch dafür, dass ein zugehöriger User erstellt wird.
    game = create(:game)
    # Überprüft, ob das Game-Objekt gültig ist.
    assert game.valid?, "Game should be valid when created via factory"
  end

  test "should be invalid without a user" do
    # Erstellt ein Game-Objekt, überschreibt aber den zugehörigen User auf nil.
    # Rails' `belongs_to` Assoziation fügt standardmäßig eine Anwesenheitsvalidierung hinzu.
    game = build(:game, user: nil)
    # Überprüft, ob das Game-Objekt ungültig ist.
    refute game.valid?, "Game should be invalid without an associated user"
    # Überprüft, ob ein Fehler für die User-Assoziation vorhanden ist.
    assert_includes game.errors[:user], "must exist"
  end

  test "score should be set correctly by factory" do
    # Erstellt ein Game-Objekt über Factory Bot.
    game = create(:game)
    # Überprüft, ob der Score korrekt auf den Standardwert der Factory gesetzt ist.
    assert_equal 0, game.score, "Game score should be 0 by default from factory"
  end

  test "active status should be set correctly by factory" do
    # Erstellt ein Game-Objekt über Factory Bot.
    game = create(:game)
    # Überprüft, ob der active-Status korrekt auf den Standardwert der Factory gesetzt ist.
    assert_equal true, game.active, "Game active status should be true by default from factory"
  end
end