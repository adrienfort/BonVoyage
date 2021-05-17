class Play < ApplicationRecord
  after_create do |play|
    music = play.music
    music.nb_plays += 1
    music.save
    music.album.nb_plays += 1
    music.album.save
    music.album.artist.nb_plays += 1
    music.album.artist.save
  end

  belongs_to :music
end
