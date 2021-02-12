class CreateMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :musics do |t|
      t.string :name
      t.integer :nb_plays
      t.float :duration
      t.integer :nb_love

      t.timestamps
    end
  end
end
