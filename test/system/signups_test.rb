require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  test "signup form" do
    visit root_path

    click_link "Napravi nalog"
    assert_field("Email")
    assert_field("Lozinka")
    assert_button("Napravi nalog")
  end
end
