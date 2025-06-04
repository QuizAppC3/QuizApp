class ApplicationController < ActionController::Base
  # Diese Zeile stellt sicher, dass configure_permitted_parameters
  # vor jeder Devise-Aktion ausgeführt wird.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Erlaube zusätzliche Parameter beim Registrieren (sign up)
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])

    # Erlaube zusätzliche Parameter beim Bearbeiten des Profils (account update)
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end