require 'test_helper'

class ExplorerTest < ActiveSupport::TestCase

  # ------------------------------- CREATION ----------------------------------

  test "verify Explorer creation" do
    explorer = Explorer.new(email: "gaston@gmail.com", password: "azerty",
      first_name: "Gaston", last_name: "Rebuffat", nickname: "reb12")

    assert explorer.valid?, "Unable to valid Explorer with right params"
  end

  test "verify Explorer email validations" do
    commun_email = "gaston@gmail.com"
    explorer_1 = Explorer.new(password: "azerty", first_name: "Gaston", last_name: "Rebuffat",
      nickname: "reb12")
    explorer_2 = Explorer.new(email: commun_email, password: "azerty",
      first_name: "Jacques", last_name: "Cartier", nickname: "cartier53")

    assert_not explorer_1.valid?, "Valid Explorer without email"
    explorer_1.email = commun_email
    assert explorer_1.save, "Unable to save Explorer with right params"
    assert_not explorer_2.valid?, "Valid Explorer with email already used"
  end

  test "verify Explorer nickname validations" do
    commun_nickname = "reb12"
    explorer_1 = Explorer.new(email: "gaston@gmail.com", password: "azerty", first_name: "Gaston",
      last_name: "Rebuffat")
    explorer_2 = Explorer.new(email: "jacques@gmail.com", password: "azerty",
      first_name: "Jacques", last_name: "Cartier", nickname: commun_nickname)

    assert_not explorer_1.valid?, "Valid Explorer without nickname"
    explorer_1.nickname = commun_nickname
    assert explorer_1.save, "Unable to save Explorer with right params"
    assert_not explorer_2.valid?, "Valid Explorer with nickname already used"
  end

  test "verify Explorer first/last name validations" do
    commun_first_name = "Gaston"
    commun_last_name = "Rebuffat"
    explorer_1 = Explorer.new(email: "gaston@gmail.com", password: "azerty", nickname: "reb12")
    explorer_2 = Explorer.new(email: "jacques@gmail.com", password: "azerty", nickname: "cartier53",
      first_name: commun_first_name, last_name: commun_last_name)

    assert_not explorer_1.valid?, "Valid Explorer without first/last name"
    explorer_1.first_name = commun_first_name
    assert_not explorer_1.valid?, "Valid Explorer without last_name"
    explorer_1.last_name = commun_last_name
    assert explorer_1.save, "Unable to save Explorer with right params"
    assert explorer_2.valid?, "Unable to valid Explorer with first/last name already used"
    explorer_1.destroy
  end

  # ----------------------------------- ACCESS -----------------------------------

  test "verify Explorer access to artists through fan_artists" do
    explorer = explorers(:explorer_1)

    assert_equal explorer.fan_artists.count, 10, "Unable to count Explorer fans_artists"
    assert_equal explorer.artists.count, 10, "Unalbe to count Explorer artists"
  end

  test "verify Explorer access to albums through fan_albums" do
    explorer = explorers(:explorer_1)

    assert_equal explorer.fan_albums.count, 10, "Unable to count Explorer fan_albums"
    assert_equal explorer.albums.count, 10, "Unalbe to count Explorer albums"
  end

  test "verify Explorer access to musics through fan_musics" do
    explorer = explorers(:explorer_1)

    assert_equal explorer.fan_musics.count, 10, "Unable to count Explorer fan_musics"
    assert_equal explorer.musics.count, 10, "Unable to count Explorer musics"
  end

  # ----------------------------------- DESTROY -----------------------------------

  test "verify Explorer destroy fan_artists when destroy" do
    explorer = explorers(:explorer_1)
    nb_fan_artists = FanArtist.count
    explorer_nb_fan_artists = explorer.fan_artists.count

    explorer.destroy
    assert_equal FanArtist.count, nb_fan_artists - explorer_nb_fan_artists, "Unable to destroy fan_artists when Explorer destroy"
  end

  test "verify Explorer destroy fan_albums when destroy" do
    explorer = explorers(:explorer_1)
    nb_fan_albums = FanAlbum.count
    explorer_nb_fan_albums = explorer.fan_albums.count

    explorer.destroy
    assert_equal FanAlbum.count, nb_fan_albums - explorer_nb_fan_albums, "Unable to destroy fan_albums when Explorer destroy"
  end

  test "verify Explorer destroy fan_musics when destroy" do
    explorer = explorers(:explorer_1)
    nb_fan_musics = FanMusic.count
    explorer_nb_fan_musics = explorer.fan_musics.count

    explorer.destroy
    assert_equal FanMusic.count, nb_fan_musics - explorer_nb_fan_musics, "Unable to destroy fan_musics when Explorer destroy"
  end

end
