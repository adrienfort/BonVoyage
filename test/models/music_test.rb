require 'test_helper'

class MusicTest < ActiveSupport::TestCase

  test "verify Music creation and validations" do
    name_music = "Starting Over"
    album = albums(:album_1_1)
    music = Music.new()

    assert_not music.valid?, "Valid Music without name and album_id"
    music.album = album
    assert_not music.valid?, "Valid Music without name"
    music.name = name_music
    assert music.save, "Unable to save Music with right params"
    assert_equal music.nb_love, 0, "Invalid set of Music nb_love"
    assert_equal music.nb_plays, 0, "Invalid set of Music nb_plays"
    assert_equal music.duration, 0, "Invalid set of Music duration"
  end

  test "verify Music access to artist through album" do
    music = musics(:music_1_1_1)
    name_artist = artists(:artist_1).name

    assert_equal music.album.artist.name, name_artist, "Unable to access Music artist"
  end

  test "verify Music doesn't destroy Album when destroy" do
    music = musics(:music_1_1_1)
    nb_albums = Album.count

    music.destroy
    assert_equal Album.count, nb_albums, "Music destroy album when destroy"
  end

end
