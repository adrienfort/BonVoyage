class AddAlbumToMusics < ActiveRecord::Migration[6.0]
  def change
    add_reference :musics, :album, null: false, foreign_key: true
  end
end
