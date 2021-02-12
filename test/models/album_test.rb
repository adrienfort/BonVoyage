require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "verify Album creation" do
    album = Album.new(artist: artists(:artist_1))

    assert album.save, "Unable to save Album with right params"
    assert_equal album.duration, 0, "Invalid set of Album duration"
    assert_equal album.nb_plays, 0, "Invalid set of Album nb_plays"
  end

  test "verify Album validations"  do
    album = Album.new()

    assert_not album.valid?, "Valid Album without artist"
    album.artist = artists(:artist_1)
    assert album.valid?, "Unable to valid Album with right params"
  end

  test "verify Album doesn't destroy Artist when destroy" do
    nb_artists = Artist.count
    album = albums(:album_1_1)

    album.destroy
    assert_equal Artist.count, nb_artists, "Album destroy artist when destroy"
  end

end
