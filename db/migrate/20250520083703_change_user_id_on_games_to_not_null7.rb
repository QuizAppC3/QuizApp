class ChangeUserIdOnGamesToNotNull7 < ActiveRecord::Migration[8.0]
  def change
        change_column_null :games, :user_id, false
  end
end
