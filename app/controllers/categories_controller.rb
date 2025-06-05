class CategoriesController < ApplicationController
  def index
    # Ruft alle einzigartigen Kategorien aus der Datenbank ab, die in den Fragen vorhanden sind,
    # und speichert sie in der Instanzvariable `@unique_categories` zur Anzeige.
    @unique_categories = Question.where.not(kategorie: nil).distinct.pluck(:kategorie)
  end

  def auswahl
    # Speichert die vom Benutzer ausgewählten Kategorien in der Session.
    # Wenn keine Kategorien ausgewählt wurden, wird ein leeres Array gespeichert.
    # Danach wird das "selection"-Template gerendert, wahrscheinlich um die Auswahl zu bestätigen oder anzuzeigen.
    session[:selected_categories] = params[:selected_categories] || []
    @selected_categories = session[:selected_categories]
    render 'selection'
  end
end