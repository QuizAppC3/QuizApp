class AddHostToGames < ActiveRecord::Migration[8.0]
  def up
    # host_id als nullable hinzufügen
    add_reference :games, :host, foreign_key: { to_table: :users }, null: true

    # Für existierende Spiele: Setze host_id auf user_id (oder einen sinnvollen Default)
    execute <<-SQL.squish
      UPDATE games
      SET host_id = user_id
      WHERE host_id IS NULL
    SQL

    # Jetzt host_id NOT NULL setzen
    change_column_null :games, :host_id, false
  end

  def down
    remove_reference :games, :host, foreign_key: true
  end
end
