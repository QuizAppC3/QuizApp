class CreateQuestions < ActiveRecord::Migration[8.0]
  def change
    create_table :questions do |t|
      t.string :Frage
      t.string :Antwort1
      t.string :Antwort2
      t.string :Antwort3
      t.string :Antwort4
      t.string :Korrekt

      t.timestamps
    end
  end
end
