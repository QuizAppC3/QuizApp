class CategoriesController < ApplicationController
  def index
    @unique_categories = Question.distinct.pluck(:kategorie)
  end

  def auswahl
    session[:selected_categories] = params[:selected_categories] || []
    @selected_categories = session[:selected_categories]
    render 'selection'
  end
end