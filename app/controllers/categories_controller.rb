class CategoriesController < ApplicationController
  def index
    @unique_categories = Question.where.not(kategorie: nil).distinct.pluck(:kategorie)  
  end

  def auswahl
    @selected_categories = params[:selected_categories] || []
    render 'selection'
  end
end