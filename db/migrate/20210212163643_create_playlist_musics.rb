class CreatePlaylistMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :playlist_musics do |t|
      t.references :playlist, null: false, foreign_key: true
      t.references :music, null: false, foreign_key: true

      t.timestamps
    end
  end
end
