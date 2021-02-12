class CreateFanMusics < ActiveRecord::Migration[6.0]
  def change
    create_table :fan_musics do |t|
      t.references :music, null: false, foreign_key: true
      t.references :explorer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
