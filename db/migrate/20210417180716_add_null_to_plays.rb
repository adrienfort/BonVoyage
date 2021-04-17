class AddNullToPlays < ActiveRecord::Migration[6.0]
  def change
    change_column_null :plays, :music_id, false
  end
end
