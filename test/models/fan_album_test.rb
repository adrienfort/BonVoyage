require 'test_helper'

class FanAlbumTest < ActiveSupport::TestCase

  test "verify FanAlbum creation and validations" do
    fan = FanAlbum.new()
    album = albums(:album_1_1)
    explorer = explorers(:explorer_1)

    assert_not fan.valid?, "Valid FanAlbum without album and explorer"
    fan.album = album
    assert_not fan.valid?, "Valid FanAlbum without explorer"
    fan.explorer = explorer
    assert fan.valid?, "Unable to valid FanAlbum with right params"
  end

  test "verify FanAlbum access to explorer and artist" do
    fan_album = fan_albums(:fan_album_1_1_1)

    assert_equal "explorer_1@gmail.com", fan_album.explorer.email, "Unable to access from FanAlbum to explorer"
    assert_equal "album_1_1", fan_album.album.name, "Unable to access from FanAlbum to album"
  end

  test "verify FanAlbum doesn't destroy explorer or album when destroy" do
    fan_album = fan_albums(:fan_album_1_1_1)
    nb_explorers = Explorer.count
    nb_albums = Album.count

    fan_album.destroy
    assert_equal Explorer.count, nb_explorers, "FanAlbum destroy explorer when destroy"
    assert_equal Album.count, nb_albums, "FanAlbum destroy album when destroy"
  end

end
