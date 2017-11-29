require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  test "settings" do
    mika = users(:mika)
    visit root_path
    click_link "Prijavi se"
    fill_in "Email", with: mika.email
    fill_in "Lozinka", with: "tanjapassword"
    click_button "Prijavi se"

    select "6", from: "Koliko često želiš da daješ krv?"
    click_button "Sačuvaj"
    assert_content "Uspešno ste sačuvali podešavanja"
    assert_select "Koliko često želiš da daješ krv", selected: "6"
  end
end
