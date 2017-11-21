require "application_system_test_case"

class SignupsTest < ApplicationSystemTestCase
  test "signup form" do
    visit root_path

    click_link "Napravi nalog"
    assert_field("Email")
    assert_field("Lozinka")
    assert_button("Napravi nalog")
  end

  test "signup" do
    visit root_path
    click_link "Napravi nalog"
    fill_in "Email", :with => "tanja@example.com"
    fill_in "Lozinka", :with => "password"
    fill_in "Potvrdi lozinku", :with => "password"
    click_button "Napravi nalog"
    assert_content "Uspešno ste napravili nalog"
  end

  test "password doesn't match password_confirmation" do
    visit new_user_path
    fill_in "Email", :with => "tanja@example.com"
    fill_in "Lozinka", :with => "password"
    fill_in "Potvrdi lozinku", :with => "passwod"
    click_button "Napravi nalog"
    assert_content "Potvrda lozinke se ne poklapa"
  end
end
