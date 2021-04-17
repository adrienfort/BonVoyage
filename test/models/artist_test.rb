require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  # --------------------------------- CREATION ---------------------------------

  test "verify Artist creation" do
    artist = Artist.new(email: "booba@gmail.com", password: "azerty", name: "Booba")

    assert artist.save, "Unable to save Artist with right params"
    assert_equal artist.nb_plays, 0, "Invalid set of Artist nb_plays"
    assert_equal artist.duration, 0, "Invalid set of Artist duration"
    artist.destroy
  end

  test "verify Artist name validations" do
    commun_name = "Booba"
    artist_1 = Artist.new(email: "a@a.com", password: "azerty")
    artist_2 = Artist.new(email: "b@b.com", password: "azerty", name: commun_name)

    assert_not artist_1.valid?, "Valid Artist without a name"
    artist_1.name = commun_name
    assert artist_1.save, "Unable to save Artist with a name"
    assert_not artist_2.valid?, "Valid Artist with a name already used"
    artist_1.destroy
  end

  test "verify Artist email validations" do
    commun_email = "booba@gmail.com"
    artist_1 = Artist.new(email: "wrong_email.com", password: "azerty", name: "Booba")
    artist_2 = Artist.new(email: commun_email, password: "azerty", name: "Booba bis")

    assert_not artist_1.valid?, "Valid Artist with a wrong email"
    artist_1.email = commun_email
    assert artist_1.save, "Unable to save Artist with a right email"
    assert_not artist_2.valid?, "Valid Artist with email already used"
    artist_1.destroy
  end

  # ----------------------------------- ACCESS ----------------------------------------

  test "verify Artist access to explorers throught fan_artists" do
    artist = artists(:artist_1)

    assert_equal artist.fan_artists.count, 10, "Unable to count Artist fan_artists"
    assert_equal artist.explorers.count, 10, "Unable to count Artist explorers through fan_artists"
  end

  test "verify Artist access to musics through albums"  do
    artist = artists(:artist_1)

    assert_equal artist.albums.count, 10, "Unable to count Artist albums"
    assert_equal artist.musics.count, 10, "Unable to access Artist musics"
  end

  test "verify Artist access to plays through album through music" do
    artist = artists(:artist_1)

    assert_equal artist.plays.count, 10, "Unable to connect Artist and Play"
  end

  # ---------------------------------- DESTROY --------------------------------------

  test "verify Artist destroy fan_artists when destroy" do
    artist = artists(:artist_1)
    nb_fan_artists = FanArtist.count
    artist_nb_fan_artists = artist.fan_artists.count

    artist.destroy
    assert_equal FanArtist.count, nb_fan_artists - artist_nb_fan_artists, "Unable to destroy Artist fan_artists when destroy"
  end

  test "verify Artist destroy albums when destroy" do
    artist = artists(:artist_1)
    nb_albums = Album.count
    artist_nb_albums = artist.albums.count

    artist.destroy
    assert_equal Album.count, nb_albums - artist_nb_albums, "Unable to destroy Artist albums when destroy"
  end

end
