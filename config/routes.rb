Rails.application.routes.draw do
  # CRUD-Routen für Tasks (Standardressourcen)
  resources :tasks

  # Routen für Devise (Benutzerauthentifizierung)
  devise_for :users

  # Kategorien- und Willkommensseiten
  get "categories/index"
  get "welcome/index"

  # Root-Route: Startseite wird auf welcome#index gesetzt
  root 'welcome#index' # Anfragen auf die Root-URL gehen auf die Willkommensseite

  # Profilseite eines eingeloggten Nutzers
  get 'profile', to: 'users#profile'

  # Kategorienübersicht (zwei Wege zur gleichen Aktion)
  get '/categories', to: 'categories#index'

  # Auswahl der Kategorien (Formularverarbeitung per POST)
  post '/categories/selection', to: 'categories#auswahl' # verarbeitet die Auswahl des Benutzers

  # Health Check-Route (z.B. für Monitoring-Dienste)
  get "up" => "rails/health#show", as: :rails_health_check

  # Einzelspieler-Spielablauf
  get 'game/start', to: 'game#start', as: 'game_start'
  get 'game', to: 'game#index'
  get 'game/next_question', to: 'game#next_question', as: 'game_next_question'
  post 'game/next_question', to: 'game#next_question' # erlaubt das Laden der nächsten Frage per POST
  post 'game/answer', to: 'game#answer', as: 'game_answer' # Antwort einreichen
  get 'game/result', to: 'game#result', as: 'game_result' # Ergebnisanzeige nach dem Spiel

  # Multiplayer-Funktionalität
  get 'multiplayer/new', to: 'game#create_multiplayer', as: 'new_multiplayer_game' # neues Multiplayer-Spiel erstellen
  get 'multiplayer/start', to: 'multiplayer#start_game', as: 'start_multiplayer_game' # Start eines Multiplayer-Spiels
  get 'game/lobby', to: 'game#lobby', as: 'game_lobby' # Lobby für Spieler vor Spielstart
  get 'game/multiplayer/waiting', to: 'multiplayer#waiting', as: 'multiplayer_waiting' # Warteseite für Spieler
  get 'game/join', to: 'multiplayer#join_form', as: 'join_game' # Formular zur Eingabe des Spielcodes
  get 'game/do_join', to: 'multiplayer#join_game', as: 'do_join_game' # tatsächlicher Beitritt zum Spiel
  get 'multiplayer/question', to: 'multiplayer#question', as: 'multiplayer_question' # nächste Frage im Multiplayer
  get 'game/multiplayer/answer', to: 'multiplayer#answer', as: 'multiplayer_answer' # Antwortabgabe im Multiplayer

  
end
