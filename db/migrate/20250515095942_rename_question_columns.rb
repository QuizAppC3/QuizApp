class RenameQuestionColumns < ActiveRecord::Migration[8.0]
  def change
  rename_column :questions, :Frage, :frage
  rename_column :questions, :Antwort1, :antwort1
  rename_column :questions, :Antwort2, :antwort2
  rename_column :questions, :Antwort3, :antwort3
  rename_column :questions, :Antwort4, :antwort4
  rename_column :questions, :Korrekt, :korrekt
end
end
