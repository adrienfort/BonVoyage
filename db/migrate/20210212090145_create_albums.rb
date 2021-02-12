class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string :meaning
      t.references :artist, null: false, foreign_key: true
      t.integer :nb_plays
      t.float :duration

      t.timestamps
    end
  end
end
