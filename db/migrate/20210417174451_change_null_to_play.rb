class ChangeNullToPlay < ActiveRecord::Migration[6.0]
  def change
    change_column_null :plays, :explorer_id, true
    change_column_null :plays, :music_id, true
  end
end
