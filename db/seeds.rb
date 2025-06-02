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
  },
  {
    frage: "Wie groß ist der Durchmesser eines Basketballkorbs in Zoll?",
    antwort1: "20 Zoll",
    antwort2: "18 Zoll",
    antwort3: "16 Zoll",
    antwort4: "22 Zoll",
    korrekt: "18 Zoll",
    kategorie: "Sport"
  },
  {
    frage: "Alle wie viele Jahre finden die Olympischen Spiele statt?",
    antwort1: "2 Jahre",
    antwort2: "6 Jahre",
    antwort3: "4 Jahre",
    antwort4: "5 Jahre",
    korrekt: "4 Jahre",
    kategorie: "Sport"
  },
  {
    frage: "Welche Sportart ist als 'König der Sportarten' bekannt?",
    antwort1: "Tennis",
    antwort2: "Basketball",
    antwort3: "Fußball",
    antwort4: "Rugby",
    korrekt: "Fußball",
    kategorie: "Sport"
  },
  {
    frage: "Wie nennt man es, wenn ein Bowler drei Strikes hintereinander wirft?",
    antwort1: "Spare",
    antwort2: "Turkey",
    antwort3: "Strike-Serie",
    antwort4: "Hattrick",
    korrekt: "Turkey",
    kategorie: "Sport"
  },
  {
    frage: "Welche zwei Sportarten sind Kanadas Nationalsportarten?",
    antwort1: "Baseball und Skifahren",
    antwort2: "Basketball und Curling",
    antwort3: "Lacrosse im Sommer, Eishockey im Winter",
    antwort4: "Fußball und Eishockey",
    korrekt: "Lacrosse im Sommer, Eishockey im Winter",
    kategorie: "Sport"
  },
  {
    frage: "Wie viele Dellen hat ein durchschnittlicher Golfball?",
    antwort1: "50 bis 150",
    antwort2: "600 bis 800",
    antwort3: "200 bis 300",
    antwort4: "300 bis 500",
    korrekt: "300 bis 500",
    kategorie: "Sport"
  },
  {
    frage: "Welches Land hat am häufigsten an den Olympischen Sommerspielen teilgenommen, aber nie eine Goldmedaille gewonnen?",
    antwort1: "Peru",
    antwort2: "Indonesien",
    antwort3: "Philippinen",
    antwort4: "Thailand",
    korrekt: "Philippinen",
    kategorie: "Sport"
  },
  {
    frage: "Der Filmklassiker *Wie ein wilder Stier* von 1980 handelt von welchem echten Boxer?",
    antwort1: "Muhammad Ali",
    antwort2: "Jake LaMotta",
    antwort3: "Mike Tyson",
    antwort4: "George Foreman",
    korrekt: "Jake LaMotta",
    kategorie: "Sport"
  },
  {
    frage: "Die Triple Crown im Pferderennen wird an ein Pferd verliehen, das welche drei Rennen gewinnt?",
    antwort1: "Belmont Stakes, Royal Ascot, Kentucky Derby",
    antwort2: "Preakness Stakes, Epsom Derby, Belmont Stakes",
    antwort3: "Kentucky Derby, Preakness Stakes, Belmont Stakes",
    antwort4: "Melbourne Cup, Kentucky Derby, Prix de l’Arc de Triomphe",
    korrekt: "Kentucky Derby, Preakness Stakes, Belmont Stakes",
    kategorie: "Sport"
  },
  {
    frage: "Bei den Olympischen Spielen 1976 war Nadia Comăneci die erste Turnerin mit der perfekten Punktzahl. Welches Land vertrat sie?",
    antwort1: "Bulgarien",
    antwort2: "Rumänien",
    antwort3: "Russland",
    antwort4: "Ungarn",
    korrekt: "Rumänien",
    kategorie: "Sport"
  }, 
  {
    frage: "Wofür steht die Abkürzung NBA?",
    antwort1: "National Baseball Alliance",
    antwort2: "National Basketball Association",
    antwort3: "North Basketball Association",
    antwort4: "New Basketball Association",
    korrekt: "National Basketball Association",
    kategorie: "Sport"
  },
  {
    frage: "Welche Farbe hat die Flagge, die im Motorsport dem Sieger gezeigt wird?",
    antwort1: "Rote Flagge",
    antwort2: "Grüne Flagge",
    antwort3: "Schwarz-weiß karierte Flagge",
    antwort4: "Blaue Flagge",
    korrekt: "Schwarz-weiß karierte Flagge",
    kategorie: "Sport"
  },
  {
    frage: "Wie viele Löcher spielt man durchschnittlich bei einer Golfrunde?",
    antwort1: "9",
    antwort2: "12",
    antwort3: "18",
    antwort4: "21",
    korrekt: "18",
    kategorie: "Sport"
  },
  {
    frage: "Welche Farbe haben die Torpfosten im American Football?",
    antwort1: "Weiß",
    antwort2: "Gelb",
    antwort3: "Rot",
    antwort4: "Blau",
    korrekt: "Gelb",
    kategorie: "Sport"
  },
  {
    frage: "Wie lang ist ein Marathon?",
    antwort1: "25,2 Meilen",
    antwort2: "27,2 Meilen",
    antwort3: "26,2 Meilen",
    antwort4: "24 Meilen",
    korrekt: "26,2 Meilen",
    kategorie: "Sport"
  },
  {
    frage: "In welchem Spiel steht 'Love' für null Punkte?",
    antwort1: "Badminton",
    antwort2: "Squash",
    antwort3: "Tennis",
    antwort4: "Tischtennis",
    korrekt: "Tennis",
    kategorie: "Sport"
  },
  {
    frage: "Welche Sportart ist dem Softball sehr ähnlich?",
    antwort1: "Cricket",
    antwort2: "Baseball",
    antwort3: "Hockey",
    antwort4: "Rugby",
    korrekt: "Baseball",
    kategorie: "Sport"
  },
  {
    frage: "Wie groß ist ein olympisches Schwimmbecken in Metern?",
    antwort1: "25 x 25 Meter",
    antwort2: "50 x 20 Meter",
    antwort3: "50 x 25 Meter",
    antwort4: "60 x 30 Meter",
    korrekt: "50 x 25 Meter",
    kategorie: "Sport"
  },
  {
    frage: "Wie viele Punkte gibt ein Touchdown im American Football?",
    antwort1: "3 Punkte",
    antwort2: "7 Punkte",
    antwort3: "6 Punkte",
    antwort4: "5 Punkte",
    korrekt: "6 Punkte",
    kategorie: "Sport"
  },
  {
    frage: "Wie viele Spieler gehören zu einem Baseballteam?",
    antwort1: "10 Spieler",
    antwort2: "8 Spieler",
    antwort3: "9 Spieler",
    antwort4: "11 Spieler",
    korrekt: "9 Spieler",
    kategorie: "Sport"
  },
  {
    frage: "Wie viele Minuten dauerte der längste aufgezeichnete Ballwechsel in der Geschichte des Tennis?",
    antwort1: "15 Minuten",
    antwort2: "22 Minuten",
    antwort3: "29 Minuten",
    antwort4: "34 Minuten",
    korrekt: "29 Minuten",
    kategorie: "Sport"
  },
  {
    frage: "Was erhielten die Erstplatzierten bei den ersten modernen Olympischen Spielen?",
    antwort1: "Goldmedaillen",
    antwort2: "Silbermedaillen",
    antwort3: "Pokale",
    antwort4: "Ehrenurkunden",
    korrekt: "Silbermedaillen",
    kategorie: "Sport"
  },
  {
    frage: "Wie viele Olympische Spiele fanden in Ländern statt, die heute nicht mehr existieren?",
    antwort1: "1",
    antwort2: "2",
    antwort3: "3",
    antwort4: "4",
    korrekt: "3",
    kategorie: "Sport"
  },
  {
    frage: "Wie heißt der höchste Berg der Welt?",
    antwort1: "K2",
    antwort2: "Mount Everest",
    antwort3: "Kilimandscharo",
    antwort4: "Mont Blanc",
    korrekt: "Mount Everest",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißen die fünf Ozeane der Erde?",
    antwort1: "Atlantischer, Pazifischer, Indischer, Arktischer und Antarktischer Ozean",
    antwort2: "Atlantischer, Pazifischer, Indischer, Arktischer und Nordpolarmeer",
    antwort3: "Atlantischer, Pazifischer, Indischer, Mittelmeer und Antarktischer Ozean",
    antwort4: "Pazifischer, Atlantischer, Nordsee, Antarktischer und Arktischer Ozean",
    korrekt: "Atlantischer, Pazifischer, Indischer, Arktischer und Antarktischer Ozean",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt der längste Fluss Afrikas?",
    antwort1: "Kongo",
    antwort2: "Nil",
    antwort3: "Niger",
    antwort4: "Sambesi",
    korrekt: "Nil",
    kategorie: "Geographie"
  },
  {
    frage: "In welcher US-amerikanischen Stadt befindet sich die Golden Gate Bridge?",
    antwort1: "Los Angeles",
    antwort2: "San Francisco",
    antwort3: "San Diego",
    antwort4: "Seattle",
    korrekt: "San Francisco",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt die Hauptstadt von Mexiko?",
    antwort1: "Guadalajara",
    antwort2: "Mexiko-Stadt",
    antwort3: "Tijuana",
    antwort4: "Cancún",
    korrekt: "Mexiko-Stadt",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt das flächenmäßig größte Land der Welt?",
    antwort1: "Kanada",
    antwort2: "USA",
    antwort3: "China",
    antwort4: "Russland",
    korrekt: "Russland",
    kategorie: "Geographie"
  },
  {
    frage: "Welcher US-Bundesstaat hat keine dokumentierten giftigen Schlangen?",
    antwort1: "Hawaii",
    antwort2: "Alaska",
    antwort3: "Montana",
    antwort4: "Vermont",
    korrekt: "Alaska",
    kategorie: "Geographie"
  },
  {
    frage: "Wo befinden sich die Spanischen Treppen?",
    antwort1: "Madrid, Spanien",
    antwort2: "Rom, Italien",
    antwort3: "Florenz, Italien",
    antwort4: "Barcelona, Spanien",
    korrekt: "Rom, Italien",
    kategorie: "Geographie"
  },
  {
    frage: "Wie viele Länder gibt es im Vereinigten Königreich?",
    antwort1: "3",
    antwort2: "4",
    antwort3: "5",
    antwort4: "6",
    korrekt: "4",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt die Hauptstadt des Senegal?",
    antwort1: "Dakar",
    antwort2: "Accra",
    antwort3: "Bamako",
    antwort4: "Lagos",
    korrekt: "Dakar",
    kategorie: "Geographie"
  },
  {
    frage: "Wie viele Zeitzonen hat Russland?",
    antwort1: "9",
    antwort2: "10",
    antwort3: "11",
    antwort4: "12",
    korrekt: "11",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt der höchste Berg Kanadas?",
    antwort1: "Mount Logan",
    antwort2: "Mount McKinley",
    antwort3: "Mount Robson",
    antwort4: "Mount Columbia",
    korrekt: "Mount Logan",
    kategorie: "Geographie"
  },
  {
    frage: "Welche zwei Länder grenzen nördlich direkt an Ungarn?",
    antwort1: "Polen und Tschechien",
    antwort2: "Slowakei und Ukraine",
    antwort3: "Österreich und Slowakei",
    antwort4: "Rumänien und Ukraine",
    korrekt: "Slowakei und Ukraine",
    kategorie: "Geographie"
  },
  
  {
    frage: "Wie heißt der zweithöchste Berg der Welt?",
    antwort1: "Kangchenjunga",
    antwort2: "K2",
    antwort3: "Lhotse",
    antwort4: "Makalu",
    korrekt: "K2",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt der südlichste Punkt Afrikas?",
    antwort1: "Kap der Guten Hoffnung",
    antwort2: "Kap Horn",
    antwort3: "Kap Verde",
    antwort4: "Kap Agulhas",
    korrekt: "Kap Agulhas",
    kategorie: "Geographie"
  },
  {
    frage: "Welches Blatt ist auf der kanadischen Flagge abgebildet?",
    antwort1: "Ahornblatt",
    antwort2: "Eichenblatt",
    antwort3: "Eschenblatt",
    antwort4: "Birkenblatt",
    korrekt: "Ahornblatt",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt die Hauptstadt von Nova Scotia?",
    antwort1: "Halifax",
    antwort2: "Toronto",
    antwort3: "Vancouver",
    antwort4: "Montreal",
    korrekt: "Halifax",
    kategorie: "Geographie"
  },
  {
    frage: "Welches Land benutzte zuerst Lametta als Weihnachtsbaumschmuck?",
    antwort1: "Deutschland",
    antwort2: "Österreich",
    antwort3: "Schweden",
    antwort4: "USA",
    korrekt: "Deutschland",
    kategorie: "Geographie"
  },
  {
    frage: "Welche Jahreszeit herrscht in Australien im Dezember?",
    antwort1: "Sommer",
    antwort2: "Winter",
    antwort3: "Herbst",
    antwort4: "Frühling",
    korrekt: "Sommer",
    kategorie: "Geographie"
  },
  {
    frage: "Wie heißt der trockenste Kontinent der Erde?",
    antwort1: "Afrika",
    antwort2: "Antarktis",
    antwort3: "Australien",
    antwort4: "Asien",
    korrekt: "Antarktis",
    kategorie: "Geographie"
  },
  {
    frage: "Peking-Ente ist das Nationalgericht welches Landes?",
    antwort1: "Japan",
    antwort2: "China",
    antwort3: "Korea",
    antwort4: "Vietnam",
    korrekt: "China",
    kategorie: "Geographie"
  },
  {
    frage: "In welcher europäischen Stadt fand der erste organisierte Marathon statt?",
    antwort1: "Rom",
    antwort2: "Athen",
    antwort3: "Paris",
    antwort4: "London",
    korrekt: "Athen",
    kategorie: "Geographie"
  },
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
    frage: "Welches Ereignis markierte den Beginn der Französischen Revolution?",
    antwort1: "Ballhausschwur",
    antwort2: "Sturm auf die Bastille",
    antwort3: "Einberufung der Generalstände",
    antwort4: "Hinrichtung Ludwigs XVI.",
    korrekt: "Sturm auf die Bastille",
    kategorie: "Geschichte"
  },
  {
    frage: "Wer war der letzte Kaiser des Heiligen Römischen Reiches Deutscher Nation?",
    antwort1: "Karl V.",
    antwort2: "Friedrich II.",
    antwort3: "Franz II.",
    antwort4: "Leopold I.",
    korrekt: "Franz II.",
    kategorie: "Geschichte"
  },
  {
    frage: "In welchem Jahr zerfiel die Sowjetunion offiziell?",
    antwort1: "1989",
    antwort2: "1990",
    antwort3: "1991",
    antwort4: "1992",
    korrekt: "1991",
    kategorie: "Geschichte"
  },
  {
    frage: "Welcher Seefahrer erreichte als Erster Indien auf dem Seeweg um Afrika herum?",
    antwort1: "Christoph Kolumbus",
    antwort2: "Ferdinand Magellan",
    antwort3: "James Cook",
    antwort4: "Vasco da Gama",
    korrekt: "Vasco da Gama",
    kategorie: "Geschichte"
  },
  {
    frage: "Wie nannte man die Periode des Kalten Krieges, in der sich die Spannungen zwischen den Supermächten entspannten?",
    antwort1: "Perestroika",
    antwort2: "Glasnost",
    antwort3: "Détente",
    antwort4: "Containment",
    korrekt: "Détente",
    kategorie: "Geschichte"
  },
  {
    frage: "Welche römische Gottheit war die Göttin der Weisheit und des Krieges?",
    antwort1: "Juno",
    antwort2: "Venus",
    antwort3: "Diana",
    antwort4: "Minerva",
    korrekt: "Minerva",
    kategorie: "Geschichte"
  },
  {
    frage: "Wer verfasste die 95 Thesen, die als Auslöser der Reformation gelten?",
    antwort1: "Johannes Calvin",
    antwort2: "Huldrych Zwingli",
    antwort3: "Martin Luther",
    antwort4: "Jan Hus",
    korrekt: "Martin Luther",
    kategorie: "Geschichte"
  },
  {
    frage: "Welche Stadt wurde im Jahr 1453 von den Osmanen erobert und beendete damit das Byzantinische Reich?",
    antwort1: "Athen",
    antwort2: "Rom",
    antwort3: "Konstantinopel",
    antwort4: "Alexandria",
    korrekt: "Konstantinopel",
    kategorie: "Geschichte"
  },
  {
    frage: "In welchem Jahr fand die Schlacht von Hastings statt?",
    antwort1: "1066",
    antwort2: "1077",
    antwort3: "1088",
    antwort4: "1099",
    korrekt: "1066",
    kategorie: "Geschichte"
  },
  {
    frage: "Welche europäische Großmacht war im 17. Jahrhundert bekannt für ihr 'Goldenes Zeitalter' in Kunst und Wissenschaft?",
    antwort1: "Frankreich",
    antwort2: "England",
    antwort3: "Niederlande",
    antwort4: "Spanien",
    korrekt: "Niederlande",
    kategorie: "Geschichte"
  },
  {
    frage: "Wer war der erste Kanzler des Deutschen Reiches nach dessen Gründung 1871?",
    antwort1: "Helmuth von Moltke",
    antwort2: "Wilhelm I.",
    antwort3: "Theobald von Bethmann Hollweg",
    antwort4: "Otto von Bismarck",
    korrekt: "Otto von Bismarck",
    kategorie: "Geschichte"
  },
  {
    frage: "Welches ist das oberste Gericht in Deutschland für Verfassungsfragen?",
    antwort1: "Bundesgerichtshof",
    antwort2: "Bundesverwaltungsgericht",
    antwort3: "Bundesarbeitsgericht",
    antwort4: "Bundesverfassungsgericht",
    korrekt: "Bundesverfassungsgericht",
    kategorie: "Politik"
  },
  {
    frage: "Wie viele Bundesländer hat die Bundesrepublik Deutschland?",
    antwort1: "13",
    antwort2: "14",
    antwort3: "15",
    antwort4: "16",
    korrekt: "16",
    kategorie: "Politik"
  },
  {
    frage: "Wer war der erste Bundespräsident der Bundesrepublik Deutschland?",
    antwort1: "Konrad Adenauer",
    antwort2: "Heinrich Lübke",
    antwort3: "Gustav Heinemann",
    antwort4: "Theodor Heuss",
    korrekt: "Theodor Heuss",
    kategorie: "Politik"
  },
  {
    frage: "Welches Gremium vertritt die Interessen der Bundesländer auf Bundesebene?",
    antwort1: "Bundestag",
    antwort2: "Bundeskanzleramt",
    antwort3: "Bundesregierung",
    antwort4: "Bundesrat",
    korrekt: "Bundesrat",
    kategorie: "Politik"
  },
  {
    frage: "Wann wurde Berlin offiziell zur Hauptstadt des wiedervereinigten Deutschlands erklärt?",
    antwort1: "1989",
    antwort2: "1990",
    antwort3: "1991",
    antwort4: "1999",
    korrekt: "1990",
    kategorie: "Politik"
  },
  {
    frage: "Welche Partei regierte Deutschland am längsten in der Nachkriegsgeschichte (Stand 2024)?",
    antwort1: "SPD",
    antwort2: "FDP",
    antwort3: "CDU/CSU",
    antwort4: "Bündnis 90/Die Grünen",
    korrekt: "CDU/CSU",
    kategorie: "Politik"
  },
  {
    frage: "Wie heißt der aktuelle Bundeskanzler der Bundesrepublik Deutschland (Stand 2024)?",
    antwort1: "Angela Merkel",
    antwort2: "Armin Laschet",
    antwort3: "Annalena Baerbock",
    antwort4: "Olaf Scholz",
    korrekt: "Olaf Scholz",
    kategorie: "Politik"
  },
  {
    frage: "Welches Grundrecht schützt in Deutschland die freie Meinungsäußerung?",
    antwort1: "Artikel 1",
    antwort2: "Artikel 2",
    antwort3: "Artikel 5",
    antwort4: "Artikel 8",
    korrekt: "Artikel 5",
    kategorie: "Politik"
  },
  {
    frage: "Was ist die Mindestwahlbeteiligung, damit eine Bundestagswahl gültig ist?",
    antwort1: "25%",
    antwort2: "50%",
    antwort3: "75%",
    antwort4: "Keine Mindestwahlbeteiligung",
    korrekt: "Keine Mindestwahlbeteiligung",
    kategorie: "Politik"
  },
  {
    frage: "Wer ernennt in Deutschland den Bundeskanzler?",
    antwort1: "Das Volk direkt",
    antwort2: "Der Bundespräsident ohne Vorschlag",
    antwort3: "Die Bundesversammlung",
    antwort4: "Der Bundestag auf Vorschlag des Bundespräsidenten",
    korrekt: "Der Bundestag auf Vorschlag des Bundespräsidenten",
    kategorie: "Politik"
  },
  {
    frage: "Wann wurde das Grundgesetz der Bundesrepublik Deutschland verabschiedet?",
    antwort1: "1945",
    antwort2: "1949",
    antwort3: "1953",
    antwort4: "1961",
    korrekt: "1949",
    kategorie: "Politik"
  },
  {
    frage: "Welches chemische Element hat das Symbol Au?",
    antwort1: "Silber",
    antwort2: "Aluminium",
    antwort3: "Quecksilber",
    antwort4: "Gold",
    korrekt: "Gold",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Was ist die Einheit der elektrischen Stromstärke?",
    antwort1: "Volt",
    antwort2: "Ohm",
    antwort3: "Watt",
    antwort4: "Ampere",
    korrekt: "Ampere",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Welcher Planet ist der Erde am nächsten?",
    antwort1: "Mars",
    antwort2: "Jupiter",
    antwort3: "Merkur",
    antwort4: "Venus",
    korrekt: "Venus",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Wie viele Knochen hat ein erwachsener Mensch durchschnittlich?",
    antwort1: "198",
    antwort2: "206",
    antwort3: "212",
    antwort4: "220",
    korrekt: "206",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Was ist der Hauptbestandteil der Erdatmosphäre?",
    antwort1: "Sauerstoff",
    antwort2: "Kohlendioxid",
    antwort3: "Argon",
    antwort4: "Stickstoff",
    korrekt: "Stickstoff",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Welche Kraft hält die Planeten auf ihren Umlaufbahnen um die Sonne?",
    antwort1: "Zentrifugalkraft",
    antwort2: "Magnetismus",
    antwort3: "Kernkraft",
    antwort4: "Gravitation",
    korrekt: "Gravitation",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Was bezeichnet man in der Biologie als Photosynthese?",
    antwort1: "Den Abbau von Zucker",
    antwort2: "Die Zellatmung",
    antwort3: "Die Fortpflanzung von Pflanzen",
    antwort4: "Die Umwandlung von Lichtenergie in chemische Energie",
    korrekt: "Die Umwandlung von Lichtenergie in chemische Energie",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Welches physikalische Prinzip besagt, dass Energie weder erzeugt noch vernichtet, sondern nur umgewandelt werden kann?",
    antwort1: "Das Ohmsche Gesetz",
    antwort2: "Das Newtonsches Gesetz",
    antwort3: "Das Archimedische Prinzip",
    antwort4: "Das Gesetz der Energieerhaltung",
    korrekt: "Das Gesetz der Energieerhaltung",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Was ist der pH-Wert von reinem Wasser bei 25°C?",
    antwort1: "0",
    antwort2: "7",
    antwort3: "10",
    antwort4: "14",
    korrekt: "7",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Welcher Bestandteil des Blutes ist für den Sauerstofftransport verantwortlich?",
    antwort1: "Weiße Blutkörperchen",
    antwort2: "Blutplättchen",
    antwort3: "Plasma",
    antwort4: "Rote Blutkörperchen",
    korrekt: "Rote Blutkörperchen",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "Welches ist das größte Organ des menschlichen Körpers?",
    antwort1: "Gehirn",
    antwort2: "Lunge",
    antwort3: "Leber",
    antwort4: "Haut",
    korrekt: "Haut",
    kategorie: "Naturwissenschaften"
  },
  {
    frage: "In welchem Land ist es gesetzlich verboten, Kaugummi zu kauen?",
    antwort1: "China",
    antwort2: "Japan",
    antwort3: "Saudi-Arabien",
    antwort4: "Singapur",
    korrekt: "Singapur",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Welches ist das einzige Lebensmittel, das nicht verdirbt?",
    antwort1: "Reis",
    antwort2: "Nudeln",
    antwort3: "Salz",
    antwort4: "Honig",
    korrekt: "Honig",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Wie viele Streifen hat ein Zebra durchschnittlich?",
    antwort1: "Zwischen 20 und 40",
    antwort2: "Zwischen 40 und 80",
    antwort3: "Zwischen 80 und 120",
    antwort4: "Jedes Zebra hat eine einzigartige Anzahl",
    korrekt: "Jedes Zebra hat eine einzigartige Anzahl",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Welches ist die am häufigsten benutzte Farbe auf Flaggen weltweit?",
    antwort1: "Blau",
    antwort2: "Grün",
    antwort3: "Weiß",
    antwort4: "Rot",
    korrekt: "Rot",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Wie viele Krümel entstehen durchschnittlich beim Essen eines Kekses?",
    antwort1: "Weniger als 10",
    antwort2: "Mehr als 50",
    antwort3: "Kommt auf den Keks an",
    antwort4: "Keine feste Anzahl",
    korrekt: "Keine feste Anzahl",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Welches Tier hat das größte Auge im Verhältnis zu seiner Körpergröße?",
    antwort1: "Mensch",
    antwort2: "Kolibri",
    antwort3: "Riesenkrake",
    antwort4: "Chamäleon",
    korrekt: "Chamäleon",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Wie viele Minuten dauert ein durchschnittlicher Schluckauf-Anfall?",
    antwort1: "Weniger als 1",
    antwort2: "Zwischen 1 und 5",
    antwort3: "Mehr als 5",
    antwort4: "Es gibt keine Durchschnittsdauer",
    korrekt: "Es gibt keine Durchschnittsdauer",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Was ist der offizielle Name des Zeichens '@'?",
    antwort1: "At-Zeichen",
    antwort2: "Klammeraffe",
    antwort3: "Ad-Symbol",
    antwort4: "Commercial At",
    korrekt: "Commercial At",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Wie oft blinzelt ein Mensch durchschnittlich pro Minute?",
    antwort1: "1-5 Mal",
    antwort2: "6-10 Mal",
    antwort3: "Mehr als 25 Mal",
    antwort4: "15-20 Mal",
    korrekt: "15-20 Mal",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Wie viele Zehen hat eine Katze an den Hinterpfoten?",
    antwort1: "3",
    antwort2: "4",
    antwort3: "5",
    antwort4: "6",
    korrekt: "4",
    kategorie: "Unnützes Wissen"
  },
  {
    frage: "Welches ist der am häufigsten gestohlene Gegenstand in Bibliotheken?",
    antwort1: "Kugelschreiber",
    antwort2: "Bücher",
    antwort3: "Batterien",
    antwort4: "Toilettenpapier",
    korrekt: "Toilettenpapier",
    kategorie: "Unnützes Wissen"
  }
])
