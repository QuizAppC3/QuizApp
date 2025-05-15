# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Question.create([
  {
    Frage: "Was ist 2 + 2?",
    Antwort1: "3",
    Antwort2: "4",
    Antwort3: "5",
    Antwort4: "6",
    Korrekt: "4"
  },
  {
    Frage: "Welche Farbe hat der Himmel?",
    Antwort1: "Grün",
    Antwort2: "Blau",
    Antwort3: "Rot",
    Antwort4: "Gelb",
    Korrekt: "Blau"
  }
])
