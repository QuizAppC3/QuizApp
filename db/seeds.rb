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
    frage: "Was ist 2 + 2?",
    antwort1: "3",
    antwort2: "4",
    antwort3: "5",
    antwort4: "6",
    korrekt: "4",
    kategorie: "Test"
  },
  {
    frage: "Welche Farbe hat der Himmel?",
    antwort1: "Grün",
    antwort2: "Blau",
    antwort3: "Rot",
    antwort4: "Gelb",
    korrekt: "Blau",
    kategorie: "Test"
  },
  {
    frage: "Wie viele Tage hat eine Woche?",
    antwort1: "5",
    antwort2: "6",
    antwort3: "7",
    antwort4: "8",
    korrekt: "7",
    kategorie: "Test"
  },
  {
    frage: "Welcher Planet ist der dritte von der Sonne?",
    antwort1: "Mars",
    antwort2: "Venus",
    antwort3: "Erde",
    antwort4: "Jupiter",
    korrekt: "Erde",
    kategorie: "Test"
  },
  {
    frage: "Was ist die Hauptstadt von Deutschland?",
    antwort1: "München",
    antwort2: "Berlin",
    antwort3: "Hamburg",
    antwort4: "Köln",
    korrekt: "Berlin",
    kategorie: "Test"
  },
  {
    frage: "Wie heißt der längste Fluss der Welt?",
    antwort1: "Nil",
    antwort2: "Amazonas",
    antwort3: "Donau",
    antwort4: "Mississippi",
    korrekt: "Amazonas",
    kategorie: "Test"
  },
  {
    frage: "Welche Zahl ist eine Primzahl?",
    antwort1: "9",
    antwort2: "15",
    antwort3: "7",
    antwort4: "21",
    korrekt: "7",
    kategorie: "Test"
  },
  {
    frage: "Welche Sprache wird in Spanien gesprochen?",
    antwort1: "Italienisch",
    antwort2: "Spanisch",
    antwort3: "Französisch",
    antwort4: "Portugiesisch",
    korrekt: "Spanisch",
    kategorie: "Test"
  },
  {
    frage: "Wie viele Kontinente gibt es?",
    antwort1: "5",
    antwort2: "6",
    antwort3: "7",
    antwort4: "8",
    korrekt: "7",
    kategorie: "Test"
  },
  {
    frage: "Welches Tier ist ein Säugetier?",
    antwort1: "Hai",
    antwort2: "Frosch",
    antwort3: "Delfin",
    antwort4: "Eidechse",
    korrekt: "Delfin",
    kategorie: "Test"
  },
  {
    frage: "Welches Land hat die Form eines Stiefels?",
    antwort1: "Spanien",
    antwort2: "Italien",
    antwort3: "Frankreich",
    antwort4: "Deutschland",
    korrekt: "Italien",
    kategorie: "Test"
  },
  {
    frage: "Wie heißt das chemische Symbol für Wasser?",
    antwort1: "O2",
    antwort2: "H2O",
    antwort3: "CO2",
    antwort4: "NaCl",
    korrekt: "H2O",
    kategorie: "Test"
  },
  {
    frage: "Was ergibt 5 × 6?",
    antwort1: "11",
    antwort2: "30",
    antwort3: "35",
    antwort4: "25",
    korrekt: "30",
    kategorie: "Test"
  },
  {
    frage: "Welche Farbe ergibt Blau + Gelb?",
    antwort1: "Grün",
    antwort2: "Orange",
    antwort3: "Lila",
    antwort4: "Braun",
    korrekt: "Grün",
    kategorie: "Test"
  },
  {
    frage: "Was ist ein Synonym für 'schnell'?",
    antwort1: "träge",
    antwort2: "flink",
    antwort3: "langsam",
    antwort4: "ruhig",
    korrekt: "flink",
    kategorie: "Test"
  },
  {
    frage: "Wie nennt man einen Sechsseiter?",
    antwort1: "Tetraeder",
    antwort2: "Hexaeder",
    antwort3: "Oktagon",
    antwort4: "Zylinder",
    korrekt: "Hexaeder",
    kategorie: "Test"
  },
  {
    frage: "In welchem Jahr war die deutsche Wiedervereinigung?",
    antwort1: "1990",
    antwort2: "1989",
    antwort3: "1991",
    antwort4: "1987",
    korrekt: "1990",
    kategorie: "Test"
  },
  {
    frage: "Welcher dieser Werte ist ein Vielfaches von 9?",
    antwort1: "16",
    antwort2: "27",
    antwort3: "22",
    antwort4: "25",
    korrekt: "27",
    kategorie: "Test"
  },
  {
    frage: "Welche Einheit misst elektrische Spannung?",
    antwort1: "Watt",
    antwort2: "Ampere",
    antwort3: "Volt",
    antwort4: "Ohm",
    korrekt: "Volt",
    kategorie: "Test"
  },
  {
    frage: "Welches Tier legt Eier?",
    antwort1: "Hund",
    antwort2: "Katze",
    antwort3: "Huhn",
    antwort4: "Pferd",
    korrekt: "Huhn",
    kategorie: "Test"
  }
])

