require 'test_helper'

class PlaylistMusicTest < ActiveSupport::TestCase

  # ------------------------------- CREATION ---------------------------------

  test "verify PlaylistMusic creation and validations" do
    play = PlaylistMusic.new()
    music = musics(:music_1_1_1)
    playlist = playlists(:playlist_1_1)

    assert_not play.valid?, "Valid PlaylistMusic without playlist and music"
    play.music = music
    assert_not play.valid?, "Valid PlaylistMusic without playlist"
    play.playlist = playlist
    assert play.valid?, "Unable to valid PlaylistMusic with right params"
  end

    # ------------------------------ ACCESS ----------------------------------

    # nothing

    # ------------------------------ DESTROY ----------------------------------

  test "verify PlaylistMusic doesn't destroy music when destroy" do
    play = playlist_musics(:playlist_music_1_1_1_1_1)
    nb_music = Music.count

    play.destroy
    assert_equal Music.count, nb_music, "PlaylistMusic destroy musics when destroy"
  end

  test "verify PlaylistMusic doesn't destroy playlist when destroy" do
    play = playlist_musics(:playlist_music_1_1_1_1_1)
    nb_playlist = Playlist.count

    play.destroy
    assert_equal Playlist.count, nb_playlist, "PlaylistMusic destroy playlists when destroy"
  end

end
