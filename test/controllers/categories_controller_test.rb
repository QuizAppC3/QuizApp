require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # Wichtig: Diese Zeile ermöglicht Ihnen die direkte Verwendung von create(:question)
  include FactoryBot::Syntax::Methods

  # Die setup-Methode wird vor JEDEM Test ausgeführt.
  # Das stellt sicher, dass jeder Test mit einem sauberen Satz von Daten beginnt.
  def setup
    # Erstellt Fragen mit spezifischen Kategorien für Ihre Tests
    @mathematik_frage = create(:question, kategorie: 'Mathematik', frage: 'Was ist 2 + 2?', korrekt: '4', antwort1: '3', antwort2: '4', antwort3: '5', antwort4: '6')
    @physik_frage = create(:question, kategorie: 'Physik', frage: 'Was ist die Schwerkraft?', korrekt: 'Anziehungskraft', antwort1: 'Antrieb', antwort2: 'Anziehungskraft', antwort3: 'Druck', antwort4: 'Reibung')

    # Erstellt ein Duplikat, um sicherzustellen, dass 'distinct' funktioniert
    create(:question, kategorie: 'Mathematik', frage: 'Was ist 1 + 1?', korrekt: '2', antwort1: '1', antwort2: '2', antwort3: '3', antwort4: '4')
  end

  # Test für die #index-Aktion
  test "should get index and assign unique categories" do
    get categories_index_url
    assert_response :success # Überprüft, ob der HTTP-Status 200 (OK) ist
    # Überprüft, ob @unique_categories die erwarteten Kategorien enthält
    assert_equal ['Mathematik', 'Physik'].sort, assigns(:unique_categories).sort
  end

  # Test für die #auswahl-Aktion mit ausgewählten Kategorien
  test "should post auswahl and store selected categories in session" do
    selected_categories = ['Biologie', 'Chemie']
    post categories_auswahl_url, params: { selected_categories: selected_categories }

    assert_response :success # Überprüft den HTTP-Status (oder :redirect, falls Sie umleiten)
    assert_equal selected_categories, session[:selected_categories] # Überprüft die Session
    assert_template 'selection' # Überprüft, ob das richtige Template gerendert wird
    assert_equal selected_categories, assigns(:selected_categories) # Überprüft die Instanzvariable
  end

  # Test für die #auswahl-Aktion ohne ausgewählte Kategorien
  test "should post auswahl without selected categories and store empty array in session" do
    post categories_auswahl_url # Keine params[:selected_categories] übergeben

    assert_response :success
    assert_equal [], session[:selected_categories]
    assert_template 'selection'
    assert_equal [], assigns(:selected_categories)
  end

  # Zusätzlicher Test: Was passiert, wenn keine Fragen in der Datenbank sind?
  test "should get index and assign an empty array when no categories exist" do
    Question.destroy_all # Löscht alle vorhandenen Fragen, um diesen Zustand zu testen
    get categories_index_url
    assert_response :success
    assert_equal [], assigns(:unique_categories)
  end

  # Zusätzlicher Test: Überprüfen, ob die 'selection'-View immer gerendert wird
  test "should render the selection template on POST auswahl regardless of selection" do
    post categories_auswahl_url, params: { selected_categories: ['OnlyThisTest'] }
    assert_template 'selection'
    post categories_auswahl_url # Ohne Parameter
    assert_template 'selection'
  end
end