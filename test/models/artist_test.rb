require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  test "verify Artist creation" do
    artist = Artist.new(email: "booba@gmail.com", password: "azerty", name: "Booba")

    assert_equal artist.nb_plays, 0, "Invalid set of Artist nb_plays"
    assert_equal artist.duration, 0, "Invalid set of Artist duration"
    assert artist.valid? "Unable to valid Artist with right params"
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

  test "verify Artist nb_plays update" do
    artist = artists(:artist_1)
    nb_plays = artist.nb_plays

    artist.nb_plays += 120
    assert_equal artist.nb_plays, nb_plays + 120, "Unable to update Artist duration"
  end

  test "verify Artist duration update" do
    artist = artists(:artist_1)
    duration = artist.duration

    artist.duration += 3.52
    assert_equal artist.duration, duration + 3.52, "Unable to update (+) Artist duration"
    artist.duration -= 2.45
    assert_equal artist.duration, duration + 3.52 - 2.45, "Unable to update (-) Artist duration"
  end

  test "verify Artist access to fan_artists and explorers" do
    artist = artists(:artist_1)

    assert_equal artist.fan_artists.count, 10, "Unable to count Artist fan_artists"
    assert_equal artist.explorers.count, 10, "Unable to count Artist explorers through fan_artists"
  end

  test "verify Artist destroy fan_artists when destroy" do
    artist = artists(:artist_1)
    nb_fan_artists = FanArtist.count
    artist_nb_fan_artists = artist.fan_artists.count

    artist.destroy
    assert_equal FanArtist.count, nb_fan_artists - artist_nb_fan_artists, "Unable to destroy Artist fan_artists when destroy"
  end

  test "verify Artist doesn't destroy explorers when destroy" do
    artist = artists(:artist_1)
    nb_explorers = Explorer.count

    artist.destroy
    assert_equal Explorer.count, nb_explorers, "Artist destroy explorers when destroy"
  end

end
