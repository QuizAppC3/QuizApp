# test/models/user_test.rb
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # Die setup-Methode kann jetzt noch einfacher sein oder entfallen,
  # da Factory Bot die Benutzererstellung übernimmt.
  # def setup
  #   # Wenn du hier spezifische Dinge vor jedem Test brauchst
  # end

  test "should be a valid user with valid attributes from factory" do
    # Erstellt einen Benutzer über Factory Bot
    # Factory Bot fügt automatisch eine einzigartige E-Mail und ein Passwort hinzu
    user = create(:user) # 'create' speichert den Benutzer in der Datenbank
    assert user.valid?, "User should be valid when created via factory"
  end

  test "should be invalid without an email (devise validation)" do
    # Erstellt einen Benutzer, aber überschreibt die E-Mail auf nil
    user = build(:user, email: nil) # 'build' erstellt ein Objekt, speichert es aber nicht
    refute user.valid?, "User should be invalid without an email"
    assert_includes user.errors[:email], "can't be blank"
  end

  test "should be invalid without a password (devise validation)" do
    # Erstellt einen Benutzer, aber überschreibt das Passwort auf nil
    user = build(:user, password: nil, password_confirmation: nil)
    refute user.valid?, "User should be invalid without a password"
    assert_includes user.errors[:password], "can't be blank"
  end

  test "should be invalid with a password too short (devise validation)" do
    # Erstellt einen Benutzer mit einem zu kurzen Passwort
    user = build(:user, password: "abc", password_confirmation: "abc")
    refute user.valid?, "User should be invalid with a short password"
    assert_includes user.errors[:password], "is too short (minimum is 6 characters)"
  end

  test "email should be unique" do
    # Erstelle den ersten Benutzer und speichere ihn in der Datenbank
    create(:user, email: "unique@example.com")
    # Versuche, einen zweiten Benutzer mit der GLEICHEN E-Mail zu erstellen
    user = build(:user, email: "unique@example.com")
    refute user.valid?, "User should be invalid with a duplicate email"
    assert_includes user.errors[:email], "has already been taken"
  end
end