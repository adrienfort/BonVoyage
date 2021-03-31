require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  # -------------------------------- CREATION --------------------------------

  test "verify Album creation" do
    album = Album.new(artist: artists(:artist_1), name: "Circle")
    file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")
    album.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/png')

    assert album.save, "Unable to save Album with right params"
    assert_equal album.duration, 0, "Invalid set of Album duration"
    assert_equal album.nb_plays, 0, "Invalid set of Album nb_plays"
    album.photo.purge
    album.destroy
  end

  test "verify Album validations"  do
    name_album = "Circle"
    album = Album.new()
    file = open("#{Rails.root.to_s}/app/assets/images/default-album-picture.jpg")

    assert_not album.valid?, "Valid Album without artist and name"
    album.artist = artists(:artist_1)
    assert_not album.valid?, "Valid Album without name"
    album.name = name_album
    assert_not album.valid?, "Valid Album without photo"
    album.photo.attach(io: file, filename: 'default-album-picture.png', content_type: 'image/png')
    assert album.valid?, "Unable to valid Album with right params"
  end

  # ---------------------------------- ACCESS ---------------------------------

  test "verify Album access to explorers through fan_albums" do
    album = albums(:album_1_1)

    assert_equal album.fan_albums.count, 10, "Unable to count Album fan_albums"
    assert_equal album.explorers.count, 10, "Unable to count Album explorers"
  end

  # --------------------------------- DESTROY --------------------------------

  test "verify Album destroy fan_albums when destroy" do
    album = albums(:album_1_1)
    nb_fan_albums = FanAlbum.count
    album_nb_fan_album = album.fan_albums.count

    album.destroy
    assert_equal FanAlbum.count, nb_fan_albums - album_nb_fan_album, "Unable to destroy fan_albums when Album destroy"
  end

  test "verify Album destroy musics when destroy" do
    album = albums(:album_1_1)
    nb_musics = Music.count
    album_nb_musics = album.musics.count

    album.destroy
    assert_equal Music.count, nb_musics - album_nb_musics, "Unable to destroy musics when Album destroy"
  end

  test "verify Album doesn't destroy artist when destroy" do
    nb_artists = Artist.count
    album = albums(:album_1_1)

    album.destroy
    assert_equal Artist.count, nb_artists, "Album destroy artist when destroy"
  end

end
