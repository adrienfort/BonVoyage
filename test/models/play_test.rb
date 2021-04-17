require 'test_helper'

class PlayTest < ActiveSupport::TestCase

  # ------------------------------------- CREATION ------------------------------

  test "verify Play creation and validations" do
    music = musics(:music_1_1_1)
    artist_nb_plays = music.album.artist.nb_plays
    album_nb_plays = music.album.nb_plays
    music_nb_plays = music.nb_plays
    listen = Play.new(music: music)

    assert listen.save, "Unable to save Play with right params"
    assert_equal artist_nb_plays + 1, music.album.artist.nb_plays, "Unable to increment artist nb_plays when Play created"
    assert_equal album_nb_plays + 1, music.album.nb_plays, "Unable to increment album nb_plays when Play created"
    assert_equal music_nb_plays + 1, music.nb_plays, "Unable to increment music nb_plays when Play created"
    listen.destroy
  end

  # ------------------------------------ ACCESS ---------------------------------

  # nothing

  # ------------------------------------ DESTROY -------------------------------

  test "verify Play doesn't destroy music when destroy" do
    listen = plays(:play_1_1_1_1)
    nb_musics = Music.count

    listen.destroy
    assert_equal nb_musics, Music.count, "Play destroy Music when destroyed"
  end

end
