FactoryBot.define do
  factory :game do
    user
    score { 0 }
    active { true }
  end
end