# config/importmap.rb
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "controllers", to: "controllers/index.js", preload: true # ACHTUNG: preload: true hier ist gut!
pin_all_from "app/javascript/controllers", under: "controllers"
pin "channels", to: "channels/index.js", preload: true # Wenn du channels/index.js hast
pin_all_from "app/javascript/channels", under: "channels" # Für consumer.js etc.pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
