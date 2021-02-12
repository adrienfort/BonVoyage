class AddNameToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :name, :string
  end
end
