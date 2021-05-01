require "application_system_test_case"

class ArtistsTest < ApplicationSystemTestCase
  test "visiting the artist dashboard" do
    artist = artists(:artist_1)
    id = artist.id

    login_as artist
    visit "/artists/#{id}/dashboard"

    assert_selector "a", text: "Post"
    assert_selector "h6", text: "Dashboard"
    assert_selector "h6", text: "My works"
  end

  test "visiting the artist editation" do
    artist = artists(:artist_1)
    id = artist.id

    login_as artist
    visit "/artists/edit.#{id}"

    assert_selector "h3", text: "You are editing your profile"
  end

  test "visiting the album creation" do
    artist = artists(:artist_1)
    id = artist.id

    login_as artist
    visit "/artists/#{id}/albums/new"

    assert_selector "h3", text: "You are posting ..."
  end

  test "visiting the album editation" do
    artist = artists(:artist_1)
    artist_id = artist.id
    album = albums(:album_1_1)
    album_id = album.id

    login_as artist
    visit "/artists/#{artist_id}/albums/#{album_id}/edit"

    assert_selector "h5", text: "You are editing ..."
    assert_selector "h3", text: "#{album.name}"
  end

  test "visiting the album show artist" do
    artist = artists(:artist_1)
    artist_id = artist.id
    album = albums(:album_1_1)
    album_id = album.id

    login_as artist
    visit "/artists/#{artist_id}/albums/#{album_id}/show_artist"

    assert_selector "h4", text: "#{album.name}"
    assert_selector "p", text: "#{album.meaning}"
  end
end
