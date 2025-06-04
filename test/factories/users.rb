# spec/factories/users.rb (oder test/factories/users.rb)
FactoryBot.define do
  factory :user do
    # `sequence` ist entscheidend für uniqueness: true auf email
    sequence(:email) { |n| "user#{n}@example.com" }
    # Devise benötigt ein 'password' und 'password_confirmation' Attribut,
    # um `encrypted_password` korrekt zu setzen.
    password { "password123" }
    password_confirmation { "password123" }

    # Optional: Wenn du oft Benutzer mit einem Token für Passwort-Resets brauchst,
    # kannst du das hier hinzufügen oder als Trait definieren.
    # reset_password_token { SecureRandom.hex(10) }
    # reset_password_sent_at { 1.hour.ago }
  end
end