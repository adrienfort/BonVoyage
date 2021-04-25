require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  test "visiting the explorer sign up page" do
    visit "/explorers/sign_up"

    assert_selector "h2", text: "Sign up"
  end

  test "visiting the artist sign up page" do
    visit "/artists/sign_up"

    assert_selector "h2", text: "Sign up"
  end
end
