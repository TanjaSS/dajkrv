require "application_system_test_case"

class SettingsTest < ApplicationSystemTestCase
  test "settings" do
    mika = users(:mika)
    login(mika.email, "tanjapassword")

    select "6", from: "Koliko često želiš da daješ krv?"
    select "25", from: "user_last_donation_at_3i"
    select "Maj", from: "user_last_donation_at_2i"
    select "2017", from: "user_last_donation_at_1i"
    click_button "Sačuvaj"
    assert_content "Uspešno ste sačuvali podešavanja"
    assert_select "user_last_donation_at_3i", selected: "25"
    assert_select "user_last_donation_at_2i", selected: "Maj"
    assert_select "user_last_donation_at_1i", selected: "2017"
    assert_select "Koliko često želiš da daješ krv", selected: "6"
  end
end
