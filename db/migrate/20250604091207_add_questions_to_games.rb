class AddQuestionsToGames < ActiveRecord::Migration[8.0]
  def change
    add_column :games, :questions_order, :text
    add_column :games, :current_question_index, :integer
  end
end
