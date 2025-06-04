FactoryBot.define do
  factory :game_player do
    game { nil }
    user { nil }
    score { 1 }
  end
end
