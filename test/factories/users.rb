FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
    # Füge weitere Attribute hinzu, die dein User-Modell benötigt
  end
end