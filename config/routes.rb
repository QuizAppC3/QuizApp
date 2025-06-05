Rails.application.routes.draw do
  resources :tasks
  devise_for :users
  get "categories/index"
  get "welcome/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  root 'welcome#index' # anfragen auf root url werden auf welcome page geleitet
  get 'profile', to: 'users#profile'
 get '/categories', to: 'categories#index'
  post '/categories/selection', to: 'categories#auswahl' #
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'game/start', to: 'game#start', as: 'game_start'
  get 'game', to: 'game#index'
  get 'game/next_question', to: 'game#next_question', as: 'game_next_question'
  post 'game/next_question', to: 'game#next_question'
  post 'game/answer',       to: 'game#answer',        as: 'game_answer'
  get 'game/result', to: 'game#result', as: 'game_result'

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  # Multiplayer-Routen
  get  'multiplayer/new', to: 'game#create_multiplayer', as: 'new_multiplayer_game'
  get 'multiplayer/start', to: 'multiplayer#start_game', as: 'start_multiplayer_game'
  get  'game/lobby', to: 'game#lobby', as: 'game_lobby'
  get 'game/multiplayer/waiting', to: 'multiplayer#waiting', as: 'multiplayer_waiting'
  # Zeigt das Formular zur Codeeingabe (z.B. /game/join)
get  'game/join', to: 'multiplayer#join_form', as: 'join_game'
  get 'multiplayer/question', to: 'multiplayer#question', as: 'multiplayer_question'
  get 'game/multiplayer/answer', to: 'multiplayer#answer', as: 'multiplayer_answer'

# Bearbeitet das Formular und joint das Spiel mit Code
get  'game/do_join', to: 'multiplayer#join_game', as: 'do_join_game'



end
