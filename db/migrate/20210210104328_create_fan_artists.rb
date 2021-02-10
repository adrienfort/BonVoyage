class CreateFanArtists < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_artists do |t|
      t.references :explorer, null: false, foreign_key: true
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
