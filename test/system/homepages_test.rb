require "application_system_test_case"

class HomepagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert page.has_content?("Podsetnik za davaoce krvi")
  end
end
