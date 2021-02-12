require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "verify Album creation" do
    album = Album.new(artist: artists(:artist_1), name: "Circle")

    assert album.save, "Unable to save Album with right params"
    assert_equal album.duration, 0, "Invalid set of Album duration"
    assert_equal album.nb_plays, 0, "Invalid set of Album nb_plays"
    album.destroy
  end

  test "verify Album validations"  do
    name_album = "Circle"
    album = Album.new()

    assert_not album.valid?, "Valid Album without artist and name"
    album.artist = artists(:artist_1)
    assert_not album.valid?, "Valid Album without name"
    album.name = name_album
    assert album.valid?, "Unable to valid Album with right params"
  end

  test "verify Album doesn't destroy artist or explorer when destroy" do
    nb_artists = Artist.count
    nb_explorers = Explorer.count
    album = albums(:album_1_1)

    album.destroy
    assert_equal Artist.count, nb_artists, "Album destroy artist when destroy"
    assert_equal Explorer.count, nb_explorers, "Album destroy explorer when destroy"
  end

  test "verify Album destroy fan_album when destroy" do
    album = albums(:album_1_1)
    nb_fan_albums = FanAlbum.count
    album_fan_albums = album.fan_albums.count

    album.destroy
    assert_equal FanAlbum.count, nb_fan_albums - album_fan_albums, "Unable to destroy fan_albums when Album destroy"
  end

  test "verify Album access to fan_albums and explorers" do
    album = albums(:album_1_1)

    assert_equal album.fan_albums.count, 10, "Unable to count Album fan_albums"
    assert_equal album.explorers.count, 10, "Unable to count Album explorers"
  end

end
