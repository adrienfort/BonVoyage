require "application_system_test_case"

class ExplorersTest < ApplicationSystemTestCase
  test "visiting the explorer dashboard" do
    explorer = explorers(:explorer_1)
    id = explorer.id

    login_as explorer, scope: :explorer
    visit "/explorers/#{id}/dashboard"

    assert_selector "h6", text: "Explore"
    assert_selector "h6", text: "Artists"
    assert_selector "h6", text: "Albums"
    assert_selector "h6", text: "Playlists"
  end

  test "visiting the explorer editation" do
    explorer = explorers(:explorer_1)

    login_as explorer, scope: :explorer
    visit "/explorers/edit"

    assert_selector "h3", text: "You are editing your profile"
  end

   test "visiting the explorer playlist show" do
    explorer = explorers(:explorer_1)
    playlist = playlists(:playlist_1_1)

    login_as explorer, scope: :explorer
    visit "/explorers/#{explorer.id}/playlists/#{playlist.id}"

    assert_selector "h4", text: "#{playlist.name}"
  end

  test "visiting the rakings" do
    explorer = explorers(:explorer_1)

    login_as explorer, scope: :explorer
    visit "/explorers/#{explorer.id}/rakings"

    assert_selector "h6", text: "Artists"
    assert_selector "h6", text: "Albums"
    assert_selector "h6", text: "Musics"
  end

  test "visiting the research" do
    explorer = explorers(:explorer_1)

    login_as explorer, scope: :explorer
    visit "/explorers/#{explorer.id}/research"

    assert_selector "span", text: "Stop"
    assert_selector "select", text: "Artist"
  end
end
