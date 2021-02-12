class AddDetailsToMusics < ActiveRecord::Migration[6.0]
  def change
    change_column_null :musics, :nb_plays, 0
    change_column_default :musics, :nb_plays, 0
    change_column_null :musics, :duration, 0
    change_column_default :musics, :duration, 0
    change_column_null :musics, :nb_love, 0
    change_column_default :musics, :nb_love, 0
  end
end
