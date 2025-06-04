# test/controllers/tasks_controller_test.rb
require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # Dieser Block wird vor jedem Test ausgeführt
  setup do
    @user = create(:user) # Erstellt einen Testbenutzer über Factory Bot
    sign_in @user        # Meldet den Benutzer für den Test an (durch Devise::Test::IntegrationHelpers)

    # Erstellt einen Task, der diesem Benutzer gehört. Dies ist der Task, den wir für
    # show, edit, update, destroy verwenden.
    @task = create(:task, user: @user)
  end

  # --- Test: index ---
  test "should get index" do
    get tasks_url
    assert_response :success
    # Optionale Assertion: Prüfen, ob der Titel des erstellten Tasks auf der Seite erscheint
    assert_select "h1", "Tasks" # Anpassen an den tatsächlichen Titel in deiner View
    assert_select "p", @task.title # Anpassen an das HTML, das deine Task-Titel anzeigt
  end

  # --- Test: new ---
  test "should get new" do
    get new_task_url
    assert_response :success
  end

  # --- Test: create ---
  test "should create task" do
    assert_difference('Task.count', 1, "Sollte ein neues Task-Objekt erstellen.") do
      # `attributes_for(:task)` gibt einen Hash der Attribute, aber ohne assoziierten User.
      # Wir müssen user_id hinzufügen, da es in deiner DB 'null: false' ist und
      # der Controller wahrscheinlich die current_user.id verwenden würde.
      post tasks_url, params: { task: attributes_for(:task).merge(user_id: @user.id) }
    end
    assert_redirected_to task_url(Task.last) # Erwartet Redirect zur Show-Seite des neuen Tasks
    follow_redirect! # Folgt dem Redirect, um den Status der Zielseite zu prüfen
    assert_select "p", Task.last.title # Prüft, ob der Titel des neuen Tasks auf der Seite ist
  end

  # --- Test: show ---
  test "should show task" do
    get task_url(@task) # Verwendet den im Setup erstellten @task
    assert_response :success
    assert_select "h1", @task.title # Prüfen, ob der Task-Titel angezeigt wird
  end

  # --- Test: edit ---
  test "should get edit" do
    get edit_task_url(@task) # Verwendet den im Setup erstellten @task
    assert_response :success
  end

  # --- Test: update ---
  test "should update task" do
    new_title = "Updated Task Title"
    new_body = "This task has been updated."

    patch task_url(@task), params: { task: { title: new_title, body: new_body, status: 1 } }
    assert_redirected_to task_url(@task) # Erwartet Redirect zur Show-Seite des aktualisierten Tasks

    @task.reload # Lade den Task neu, um die Änderungen aus der Datenbank zu sehen
    assert_equal new_title, @task.title, "Task-Titel sollte aktualisiert werden."
    assert_equal new_body, @task.body, "Task-Body sollte aktualisiert werden."
  end

  # --- Test: destroy ---
  test "should destroy task" do
    assert_difference('Task.count', -1, "Sollte einen Task löschen.") do
      delete task_url(@task) # Verwendet den im Setup erstellten @task
    end
    assert_redirected_to tasks_url # Erwartet Redirect zur Index-Seite nach dem Löschen
  end

  # --- Zusätzlicher Test: Authentifizierungs-Redirect ---
  test "should redirect to login if not authenticated" do
    sign_out @user # Melde den Benutzer ab

    # Versuche, auf eine geschützte Aktion zuzugreifen
    get tasks_url
    assert_redirected_to new_user_session_url # Devise leitet zum Login um
  end
end