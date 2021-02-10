class AddDetailsToArtists < ActiveRecord::Migration[6.0]
  def change
    change_column_null :artists, :nb_plays, 0
    change_column_default :artists, :nb_plays, 0
    change_column_null :artists, :duration, 0
    change_column_default :artists, :duration, 0
  end
end
