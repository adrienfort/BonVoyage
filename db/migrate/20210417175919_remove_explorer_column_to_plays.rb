class RemoveExplorerColumnToPlays < ActiveRecord::Migration[6.0]
  def change
    remove_column :plays, :explorer_id
  end
end
