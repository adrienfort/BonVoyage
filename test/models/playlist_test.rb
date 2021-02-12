require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase

  # ----------------------------- CREATION ---------------------------------

  test "verify Playlist creation and validations" do
    playlist = Playlist.new()
    explorer = explorers(:explorer_1)
    playlist_name = "Prince de la ville"

    assert_not playlist.valid?, "Valid Playlist without explorer and name"
    playlist.explorer = explorer
    assert_not playlist.valid?, "Valid Playlist without name"
    playlist.name = playlist_name
    assert playlist.valid?, "Unable to valid Playlist with right params"
  end

  # ----------------------------- ACCESS ---------------------------------

  test "verify Playlist access to musics through playlist_musics" do
    playlist = playlists(:playlist_1_1)

    assert_equal playlist.playlist_musics.count, 10, "Unable to count Playlist playlist_musics"
    assert_equal playlist.musics.count, 10, "Unable to count Playlist musics"
  end

  # ----------------------------- DESTROY --------------------------------

  test "verify Playlist destroy playlist_musics when destroy" do
    playlist = playlists(:playlist_1_1)
    nb_playlist_musics = PlaylistMusic.count
    playlist_nb_playlist_musics = playlist.playlist_musics.count

    playlist.destroy
    assert_equal PlaylistMusic.count, nb_playlist_musics - playlist_nb_playlist_musics, "Unable to destroy playlist_musics when playlist destroy"
  end

  test "verify Playlist doesn't destroy explorer when destroy" do
    playlist = playlists(:playlist_1_1)
    nb_explorers = Explorer.count

    playlist.destroy
    assert_equal Explorer.count, nb_explorers, "Destroy explorer when Playlist destroy"
  end

end
