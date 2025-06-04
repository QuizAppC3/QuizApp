# test/controllers/game_controller_test.rb
require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest
  # Dieser Block wird vor jedem Test ausgeführt
  setup do
    @user = create(:user) # Erstellt einen Testbenutzer über Factory Bot
    sign_in @user        # Meldet den Benutzer für den Test an

    # Stelle sicher, dass genügend Fragen für die Tests vorhanden sind
    # Min. 10 Fragen sind gut, wenn zufällig ausgewählt wird, damit @question nicht nil ist.
    create_list(:question, 10)
    # Eine spezifische Frage, falls ein Test eine bestimmte Frage braucht
    @specific_question = create(:question, frage: "Was ist 1 + 1?", korrekt: "2", antwort1: "2", antwort2: "3", antwort3: "4", antwort4: "5")
  end

  # --- Test: index (unauthentifiziert) ---
  test "should get index as unauthenticated user" do
    sign_out @user # Melde den Benutzer für diesen spezifischen Test ab
    get game_url # Nutzt den Helfer für 'get game' (GameController#index)
    assert_response :success # Erwartet, dass die Seite auch ohne Login erreichbar ist
    # Prüft, dass keine Frage zugewiesen wird, wenn der Benutzer nicht angemeldet ist
    # (Dies hängt von deiner Controller-Logik ab - der Controller sollte @question nicht setzen)
    assert_nil assigns(:question), "Keine Frage sollte für unauthentifizierten Benutzer zugewiesen sein."
    # Optional: Prüfe, ob die Seite einen Hinweis auf Anmeldung enthält oder einen allgemeinen Text
    # assert_select "h1", "Willkommen zum Quiz!"
  end

  # --- Test: index (authentifiziert) ---
  test "should get index and load a question if authenticated" do
    # Benutzer ist im Setup bereits angemeldet
    get game_url # Nutzt den Helfer für 'get game'
    assert_response :success
    # **Hier ist entscheidend, dass dein GameController#index eine Frage zuweist!**
    # Annahme: Im GameController#index steht etwas wie `@question = Question.order("RANDOM()").first`
    assert_not_nil assigns(:question), "Sollte eine Frage zugewiesen haben."
    assert_instance_of Question, assigns(:question)
  end

  # --- Test: start game ---
  test "should start a new game and redirect" do
    assert_difference('Game.count', 1, "Sollte ein neues Game erstellen.") do
      # Deine routes.rb definiert 'get 'game/start', to: 'game#start', as: 'game_start''
      get game_start_url # Hier muss es ein GET Request sein!
    end
    # Controller sollte nach dem Start zu game#index oder game#next_question weiterleiten.
    # Prüfe hier, wohin dein Controller tatsächlich weiterleitet.
    assert_redirected_to game_url # Oder game_next_question_url, je nach deiner Logik
    game = Game.last # Hole das gerade erstellte Game aus der Datenbank
    assert_equal @user, game.user, "Das Spiel sollte dem angemeldeten Benutzer gehören."
    assert game.active?, "Das Spiel sollte aktiv sein nach dem Start."
    assert_equal game.id, session[:game_id], "Game ID sollte in der Session gespeichert sein."
  end

  # --- Test: handle correct answer ---
  test "should handle correct answer and update score" do
    game = create(:game, user: @user, score: 0, active: true)
    session[:game_id] = game.id # Simuliere, dass das Spiel in der Session ist

    # Erstelle eine Frage (der Controller würde sie basierend auf Game.current_question finden)
    question = create(:question, frage: "Was ist 2 + 2?", korrekt: "4", antwort1: "4", antwort2: "5")

    # Deine routes.rb definiert 'post 'game/answer', to: 'game#answer', as: 'game_answer''
    post game_answer_url, params: { answer: question.korrekt, question_id: question.id }

    # Annahme: Nach der Antwort wird zur nächsten Frage weitergeleitet (game_next_question)
    assert_redirected_to game_next_question_url, "Sollte zur nächsten Frage weiterleiten nach korrekter Antwort."
    game.reload # Lade das Game-Objekt neu, um den aktualisierten Score zu sehen
    assert_equal 1, game.score, "Score sollte nach korrekter Antwort um 1 erhöht werden."
  end

  # --- Test: handle incorrect answer ---
  test "should handle incorrect answer and not update score" do
    game = create(:game, user: @user, score: 0, active: true)
    session[:game_id] = game.id
    question = create(:question, frage: "Was ist 3 + 3?", korrekt: "6", antwort1: "7", antwort2: "6")

    # Deine routes.rb: 'post 'game/answer', to: 'game#answer', as: 'game_answer''
    post game_answer_url, params: { answer: "7", question_id: question.id } # Falsche Antwort

    assert_redirected_to game_next_question_url, "Sollte zur nächsten Frage weiterleiten nach falscher Antwort."
    game.reload
    assert_equal 0, game.score, "Score sollte bei falscher Antwort nicht erhöht werden."
  end

  # --- Test: next_question ---
  test "should get next question if authenticated and game active" do
    game = create(:game, user: @user, active: true)
    session[:game_id] = game.id

    # Deine routes.rb: 'get 'game/next_question', to: 'game#next_question', as: 'game_next_question''
    get game_next_question_url
    assert_response :success
    # Annahme: Der Controller lädt eine @question und/oder @game für die View
    assert_not_nil assigns(:question), "Sollte eine nächste Frage laden."
  end

  # --- Test: show result ---
  test "should show result and mark game as inactive" do
    # Ein Game erstellen, das beendet werden soll
    game = create(:game, user: @user, score: 5, active: true)
    session[:game_id] = game.id # Simuliere, dass dieses Game die aktuelle Session ist

    # Deine routes.rb: 'get 'game/result', to: 'game#result', as: 'game_result''
    get game_result_url
    assert_response :success
    game.reload # Lade das Game neu, um den 'active'-Status zu prüfen
    refute game.active?, "Game sollte nach Anzeige des Ergebnisses inaktiv sein."
    # Überprüfe den angezeigten Score in der View (anpassen an dein HTML)
    assert_select "h2", /Dein finaler Score: 5/ # Beispiel: Sucht nach einem h2-Tag mit dem Text "Dein finaler Score: 5"
  end

  # --- Test: Redirect bei fehlender Authentifizierung ---
  test "should redirect if not authenticated for protected actions" do
    sign_out @user # Melde den Benutzer ab

    # Teste 'game/start' (GET in deiner routes.rb)
    get game_start_url
    assert_redirected_to new_user_session_url, "GET game/start sollte zu Login umleiten."

    # Teste 'game/answer' (POST in deiner routes.rb)
    # Braucht dummy params, um nicht an der Routen-Match-Logik zu scheitern
    post game_answer_url, params: { answer: "any", question_id: create(:question).id }
    assert_redirected_to new_user_session_url, "POST game/answer sollte zu Login umleiten."

    # Teste 'game/next_question' (GET in deiner routes.rb)
    get game_next_question_url
    assert_redirected_to new_user_session_url, "GET game/next_question sollte zu Login umleiten."

    # Teste 'game/result' (GET in deiner routes.rb)
    get game_result_url
    assert_redirected_to new_user_session_url, "GET game/result sollte zu Login umleiten."
  end
end