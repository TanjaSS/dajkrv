require "application_system_test_case"

class SignInsTest < ApplicationSystemTestCase
  test "user sign in" do
    mika = users(:mika)
    visit root_path
    click_link "Prijavi se"
    fill_in "Email", with: mika.email
    fill_in "Lozinka", with: "tanjapassword"
    click_button "Prijavi se"
    assert_content "Uspešno ste se prijavili"
  end

  test "invalid password" do
    mika = users(:mika)
    visit new_login_path
    fill_in "Email", with: mika.email
    fill_in "Lozinka", with: "wrongpassword"
    click_button "Prijavi se"
    assert_content "Prijava nije uspela"
    assert_link "Prijavi se"
  end
end
