require "application_system_test_case"

class HomePagesTest < ApplicationSystemTestCase
  test "visiting the home page" do
    visit "/"

    assert_selector "h1", text: "Bon Voyage"
  end
end
