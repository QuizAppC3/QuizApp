# test/controllers/game_controller_test.rb
require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest
  # Dies ist notwendig, um Devise-Benutzer in Integration Tests anzumelden.
  include Devise::Test::IntegrationHelpers

  # Der 'setup'-Block wird vor jedem Test ausgeführt.
  setup do
    # Erstelle einen Testbenutzer und melde ihn an.
    @user = FactoryBot.create(:user)
    # Erstelle mindestens eine Frage, damit der Controller eine finden kann.
    @question = FactoryBot.create(:question)
    # Erstelle ein Game-Objekt, das später für die 'answer' und 'result' Aktionen verwendet werden kann.
    @game = FactoryBot.create(:game, user: @user)
  end

  # --- Tests für die index-Aktion ---

  test "index: should redirect to login if not authenticated" do
    # Melde den Benutzer ab, um den unauthentifizierten Zustand zu testen.
    sign_out @user
    get game_index_url
    # Erwarte eine Weiterleitung zur Devise-Login-Seite.
    assert_redirected_to new_user_session_url
  end

  test "index: should get index and load a random question if authenticated" do
    # Melde den Benutzer an.
    sign_in @user
    get game_index_url
    # Erwarte eine erfolgreiche HTTP-Antwort (200 OK).
    assert_response :success
    # Prüfe, ob eine Frage der Instanzvariablen @question zugewiesen wurde.
    assert_not_nil assigns(:question), "Sollte eine Frage zugewiesen haben."
    # Prüfe, ob der Score in der Session auf 0 initialisiert wurde.
    assert_equal 0, session[:score], "Sollte den Score in der Session auf 0 initialisieren."
  end

  # --- Tests für die start-Aktion ---

  test "start: should redirect to login if not authenticated" do
    sign_out @user
    post game_start_url, params: { total_questions: 1 }
    assert_redirected_to new_user_session_url
  end

  test "start: should initialize session and create a new game if authenticated" do
    sign_in @user
    # Prüfe, ob sich die Anzahl der Game-Objekte in der Datenbank um 1 erhöht.
    assert_difference('Game.count', 1) do
      post game_start_url, params: { total_questions: 1 }
    end
    # Erwarte eine Weiterleitung.
    assert_response :redirect
    # Prüfe, ob zur 'categories_path' weitergeleitet wird.
    assert_redirected_to categories_path
    # Prüfe die Session-Variablen.
    assert_equal 1, session[:total_questions], "total_questions sollte gesetzt sein."
    assert_equal 0, session[:question_counter], "question_counter sollte auf 0 initialisiert sein."
    assert_equal 0, session[:score], "score sollte auf 0 initialisiert sein."
    assert_equal [], session[:asked_questions], "asked_questions sollte ein leeres Array sein."
    assert_not_nil session[:game_id], "game_id sollte in der Session gespeichert sein."
    # Lade das Game-Objekt neu, um den aktuellen Status aus der Datenbank zu überprüfen.
    assert Game.find(session[:game_id]).active, "Das erstellte Spiel sollte aktiv sein."
  end

  # --- Tests für die next_question-Aktion ---

  test "next_question: should redirect to login if not authenticated" do
    sign_out @user
    get game_next_question_url
    assert_redirected_to new_user_session_url
  end

  test "next_question: should load a question and update session if authenticated" do
    sign_in @user
    # Setze Session-Variablen, um den Zustand einer laufenden Spielrunde zu simulieren.
    session[:total_questions] = 2
    session[:question_counter] = 0
    session[:score] = 0
    session[:asked_questions] = []
    # Füge das Game-Objekt zur Session hinzu, da der Controller es erwartet.
    session[:game_id] = @game.id

    get game_next_question_url
    assert_response :success
    # Prüfe, ob die 'index'-View gerendert wird.
    assert_template :index
    assert_not_nil assigns(:question), "Sollte eine Frage zugewiesen haben."
    assert_equal 1, session[:question_counter], "question_counter sollte inkrementiert sein."
    assert_includes session[:asked_questions], assigns(:question).id, "Frage-ID sollte zu asked_questions hinzugefügt werden."
  end

  # --- Tests für die answer-Aktion ---

  test "answer: should redirect to login if not authenticated" do
    sign_out @user
    patch game_answer_url, params: { question_id: @question.id, selected_answer: "Any Answer" }
    assert_redirected_to new_user_session_url
  end

  test "answer: should handle correct answer and update score" do
    sign_in @user
    # Setze Session-Variablen und Game-ID.
    session[:score] = 0
    session[:game_id] = @game.id

    # Sende die korrekte Antwort.
    patch game_answer_url, params: { question_id: @question.id, selected_answer: @question.korrekt }

    assert_redirected_to game_path(answered: true) # Prüfe die Weiterleitung.
    assert_equal "Richtig!", flash[:notice], "Sollte die 'Richtig!'-Flash-Nachricht setzen."
    assert_equal 10, session[:score], "Score in der Session sollte um 10 erhöht werden."
    # Lade das Game-Objekt neu, um den aktualisierten Score aus der Datenbank zu erhalten.
    assert_equal 10, @game.reload.score, "Score im Game-Objekt sollte aktualisiert werden."
  end

  test "answer: should handle incorrect answer and not update score" do
    sign_in @user
    session[:score] = 0
    session[:game_id] = @game.id

    # Sende eine falsche Antwort.
    patch game_answer_url, params: { question_id: @question.id, selected_answer: "Falsche Antwort" }

    assert_redirected_to game_path(answered: true)
    assert_equal "Falsch! Richtige Antwort: #{@question.korrekt}", flash[:alert], "Sollte die 'Falsch!'-Flash-Nachricht setzen."
    assert_equal 0, session[:score], "Score in der Session sollte nicht geändert werden."
    assert_equal 0, @game.reload.score, "Score im Game-Objekt sollte nicht geändert werden."
  end

  # --- Tests für die result-Aktion ---

  test "result: should redirect to login if not authenticated" do
    sign_out @user
    get game_result_url
    assert_redirected_to new_user_session_url
  end

  test "result: should get result and mark game as inactive" do
    sign_in @user
    # Stelle sicher, dass das Game-Objekt aktiv ist, bevor der Test läuft.
    @game.update(active: true)
    session[:game_id] = @game.id # Setze die Game-ID in der Session.

    get game_result_url
    assert_response :success
    # Prüfe, ob die 'result'-View gerendert wird.
    assert_template :result
    # Prüfe, ob das Game-Objekt der Instanzvariablen @game zugewiesen wurde.
    assert_equal @game, assigns(:game), "Sollte das korrekte Spiel zuweisen."
    # Lade das Game-Objekt neu und prüfe, ob es inaktiv ist.
    assert_not @game.reload.active, "Das Spiel sollte als inaktiv markiert werden."
  end
end
