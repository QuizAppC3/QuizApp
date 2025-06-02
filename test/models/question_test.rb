# test/models/question_test.rb
require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  # Der 'setup'-Block wird vor jedem Test ausgeführt.
  # Hier erstellen wir eine gültige Frage-Instanz, die wir in den Tests verwenden können.
  setup do
    @question = FactoryBot.build(:question)
  end

  # Test, ob eine Frage mit einer gültigen Kategorie gültig ist.
  test "should be valid with a valid kategorie" do
    # Wir überprüfen, ob die von FactoryBot erstellte Frage gültig ist.
    # Sie sollte es sein, da FactoryBot standardmäßig eine Kategorie setzt.
    assert @question.valid?, "Die Frage sollte mit einer gültigen Kategorie gültig sein."
  end

  # Test, ob eine Frage ohne Kategorie ungültig ist.
  test "should not be valid without a kategorie" do
    # Setze die Kategorie auf nil, um zu simulieren, dass sie fehlt.
    @question.kategorie = nil
    # Überprüfe, ob die Frage jetzt ungültig ist.
    assert_not @question.valid?, "Die Frage sollte ohne Kategorie ungültig sein."
    # Überprüfe, ob der erwartete Fehlermeldung für das 'kategorie'-Feld vorhanden ist.
    assert_includes @question.errors[:kategorie], "can't be blank",
                    "Sollte einen Fehler 'can't be blank' für 'kategorie' enthalten."
  end
end
