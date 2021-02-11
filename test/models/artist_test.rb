require 'test_helper'

class ArtistTest < ActiveSupport::TestCase

  test "Verify Artist name validations" do
    artist = artists(:artist_without_name)
    assert_not artist.valid?, "Saved artist without a name"
    artist.name = "name_verify_validations"
    assert artist.valid?, "Didn't saved artist with a name"
  end

  test "Verify Artist email validations" do
    artist = artists(:artist_wrong_email)
    artist.email = "wrong_email.com"
    assert_not artist.valid?, "Saved artist with a wrong email"
    artist.email = "artist_right_email@gmail.com"
    assert artist.valid?, "Didn't saved artist with a right email"
  end

end
