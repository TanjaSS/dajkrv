require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  test "settings" do
    mika = users(:mika)
    login(mika.email, "tanjapassword")

    select "6", from: "Na koliko meseci želiš da daješ krv?"
    select "25", from: "user_last_donation_at_3i"
    select "Maj", from: "user_last_donation_at_2i"
    select "2017", from: "user_last_donation_at_1i"
    click_button "Sačuvaj"
    assert_content "Uspešno ste sačuvali podešavanja"
    assert_select "user_last_donation_at_3i", selected: "25"
    assert_select "user_last_donation_at_2i", selected: "Maj"
    assert_select "user_last_donation_at_1i", selected: "2017"
    assert_select "Na koliko meseci želiš da daješ krv", selected: "6"
  end

  test "visitor can't see settings" do
    visit edit_settings_path
    assert_field "Email"
    assert_field "Lozinka"
    assert_button "Prijavi se"
  end
end
