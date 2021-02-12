class AddDetailsToAlbums < ActiveRecord::Migration[6.0]
  def change
    change_column_null :albums, :nb_plays, 0
    change_column_default :albums, :nb_plays, 0
    change_column_null :albums, :duration, 0
    change_column_default :albums, :duration, 0
  end
end
