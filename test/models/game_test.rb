# test/models/game_test.rb
require "test_helper"

class GameTest < ActiveSupport::TestCase
  test "should be a valid game with valid attributes from factory" do
    game = create(:game)
    assert game.valid?, "Game should be valid when created via factory"
  end

  # Dieser Test ist nur dann korrekt, wenn dein Game-Modell
  # KEIN `belongs_to :user, optional: true` hat.
  test "should be invalid without a user" do
    game = build(:game, user: nil)
    refute game.valid?, "Game should be invalid without an associated user"
    assert_includes game.errors[:user], "must exist"
  end

  test "score should be set correctly by factory" do
    game = create(:game)
    assert_equal 0, game.score, "Game score should be 0 by default from factory"
  end

  test "active status should be set correctly by factory" do
    game = create(:game)
    assert_equal true, game.active, "Game active status should be true by default from factory"
  end
end