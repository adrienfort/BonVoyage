require "application_system_test_case"

class LoginsTest < ApplicationSystemTestCase
  test "visiting the explorer login page" do
    visit "/explorers/sign_in"

    assert_selector "h2", text: "Log in"
  end

  test "visiting the artist login page" do
    visit "/artists/sign_in"

    assert_selector "h2", text: "Log in"
  end
end
