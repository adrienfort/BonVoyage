require "application_system_test_case"

class ArtistsTest < ApplicationSystemTestCase
  test "visiting the artist dashboard" do
    artist = artists(:artist_1)
    id = artist.id

    login_as artist, scope: :artist
    visit "/artists/#{id}/dashboard"

    assert_selector "a", text: "Post"
    assert_selector "h6", text: "Dashboard"
    assert_selector "h6", text: "My works"
  end

  test "visiting the artist editation" do
    artist = artists(:artist_1)
    id = artist.id

    login_as artist, scope: :artist
    visit "/artists/edit.#{id}"

    assert_selector "h3", text: "You are editing your profile"
  end

  test "visiting the album creation" do
    artist = artists(:artist_1)
    id = artist.id

    login_as artist, scope: :artist
    visit "/artists/#{id}/albums/new"

    assert_selector "h3", text: "You are posting ..."
  end

  test "visiting the artist show" do
    artist = artists(:artist_1)
    explorer = explorers(:explorer_1)

    login_as explorer, scope: :explorer
    visit "/explorers/#{explorer.id}/artists/#{artist.id}"

    assert_selector "h4", text: "#{artist.name}"
    assert_selector "h6", text: "Popular songs"
    assert_selector "h6", text: "Albums"
    assert_selector "h6", text: "Most popular album"
  end

  test "visiting the album editation" do
    artist = artists(:artist_1)
    artist_id = artist.id
    album = albums(:album_1_1)
    album_id = album.id

    login_as artist, scope: :artist
    visit "/artists/#{artist_id}/albums/#{album_id}/edit"

    assert_selector "h5", text: "You are editing ..."
    assert_selector "h3", text: "#{album.name}"
  end

  test "visiting the album show artist" do
    artist = artists(:artist_1)
    artist_id = artist.id
    album = albums(:album_1_1)
    album_id = album.id

    login_as artist, scope: :artist
    visit "/artists/#{artist_id}/albums/#{album_id}/show_artist"

    assert_selector "h4", text: "#{album.name}"
    assert_selector "p", text: "#{album.meaning}"
  end

  test "visiting the album show explorer" do
    artist = artists(:artist_1)
    artist_id = artist.id
    album = albums(:album_1_1)
    album_id = album.id
    explorer = explorers(:explorer_1)
    explorer_id = explorer.id

    login_as explorer, scope: :explorer
    visit "/explorers/#{explorer_id}/artists/#{artist_id}/albums/#{album_id}/show_explorer"

    assert_selector "h4", text: "#{album.name}"
    assert_selector "p", text: "#{album.meaning}"
  end
end
