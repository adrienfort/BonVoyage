require 'test_helper'

class FanArtistTest < ActiveSupport::TestCase

  # ------------------------------------ CREATION ---------------------------------

  test "verify FanArtist creation and validations" do
    fan = FanArtist.new()
    artist = artists(:artist_1)
    explorer = explorers(:explorer_1)

    assert_not fan.valid?, "Valid FanArtist without artist and explorer"
    fan.artist = artist
    assert_not fan.valid?, "Valid FanArtist without explorer"
    fan.explorer = explorer
    assert_not fan.valid?, "Valid FanArtist with couple explorer/artist already used"
    fan.artist = artists(:artist_2)
    fan.explorer = explorers(:explorer_2)
    assert fan.valid?, "Unable to valid FanArtist with right params"
  end

  # ------------------------------------- ACCESS ----------------------------------

  test "verify FanArtist access to explorer and artist" do
    fan = fan_artists(:fan_artist_1_1)

    assert_equal fan.artist.name, "artist_1", "Unable to access from FanArtist to artist"
    assert_equal fan.explorer.nickname, "explorer_1_nickname", "Unable to access from FanArtist to explorer"
  end

  # ----------------------------------- DESTROY -----------------------------------

  test "verify FanArtist doesn't destroy explorers or artists when destroyed" do
    fan = fan_artists(:fan_artist_1_1)
    nb_explorers = Explorer.count
    nb_artists = Artist.count

    fan.destroy
    assert_equal Explorer.count, nb_explorers, "FanArtist destroy explorers when destroyed"
    assert_equal Artist.count, nb_artists, "FanArtist destroy artists when destroyed"
  end

end
