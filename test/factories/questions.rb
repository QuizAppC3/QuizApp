FactoryBot.define do
  factory :question do
    # Annahme: 'frage' ist der Name der Spalte für die Frage
    frage { Faker::Lorem.question }

    # Die vier Antwortmöglichkeiten
    antwort1 { Faker::Lorem.word }
    antwort2 { Faker::Lorem.word }
    antwort3 { Faker::Lorem.word }
    antwort4 { Faker::Lorem.word }

    # Die korrekte Antwort
    # Wir stellen sicher, dass 'korrekt' einer der 'antwort'-Werte ist
    korrekt { |q| [q.antwort1, q.antwort2, q.antwort3, q.antwort4].sample }

    # Die Kategorie, die du bereits verwendet hast
    kategorie { Faker::Educator.subject }
  end
end