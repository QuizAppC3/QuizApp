# spec/factories/games.rb (oder test/factories/games.rb)
FactoryBot.define do
  factory :game do
    # Da user_id laut Schema NULL sein darf, aber der Foreign Key zu users existiert,
    # ist es eine gute Praxis, einen User zu assoziieren, um valide Daten zu haben.
    # Wenn ein Game ohne User existieren darf, kannst du dies bei Bedarf überschreiben.
    user

    # Default-Werte, die für Tests sinnvoll sind.
    # Beachte: score und active sind laut Schema nullbar,
    # aber es ist meist besser, sie in Tests zu definieren.
    score { 0 }
    active { true }
  end
end