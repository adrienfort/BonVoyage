class RemoveExplorerForeignKeyToPlays < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :plays, :explorers
  end
end
