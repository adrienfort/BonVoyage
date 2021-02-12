require 'test_helper'

class MusicTest < ActiveSupport::TestCase

  # ------------------------------------- CREATION ------------------------------

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
    music.destroy
  end

  # ------------------------------------ ACCESS ---------------------------------

  test "verify Music access to artist through album" do
    music = musics(:music_1_1_1)
    name_artist = artists(:artist_1).name

    assert_equal music.album.artist.name, name_artist, "Unable to access Music artist"
  end

  test "verify Music access to explorer through fan_music" do
    music = musics(:music_1_1_1)

    assert_equal music.fan_musics.count, 10, "Unable to count Music fan_musics"
    assert_equal music.explorers.count, 10, "Unable to access Music explorer"
  end

  # ------------------------------------ DESTROY -------------------------------

  test "verify Music destroy fan_musics when destroy" do
    music = musics(:music_1_1_1)
    nb_fan_musics = FanMusic.count
    music_nb_fan_musics = music.fan_musics.count

    music.destroy
    assert_equal FanMusic.count, nb_fan_musics - music_nb_fan_musics, "Unable to destroy fan_musics when Music destroy"
  end

  test "verify Music destroy playlist_musics when destroy" do
    music = musics(:music_1_1_1)
    nb_playlist_musics = PlaylistMusic.count
    music_nb_playlist_musics = music.playlist_musics.count

    music.destroy
    assert_equal PlaylistMusic.count, nb_playlist_musics - music_nb_playlist_musics, "Unable to destroy playlist_musics when Music destroy"
  end

  test "verify Music doesn't destroy Album when destroy" do
    music = musics(:music_1_1_1)
    nb_albums = Album.count

    music.destroy
    assert_equal Album.count, nb_albums, "Music destroy album when destroy"
  end

end
