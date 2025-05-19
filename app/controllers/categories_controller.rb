class CategoriesController < ApplicationController
  def index
    @unique_categories = Question.distinct.pluck(:kategorie)
  end

  def auswahl
    @selected_categories = params[:selected_categories] || []
    render 'selection'
  end
end