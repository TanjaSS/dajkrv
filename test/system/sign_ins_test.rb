require "application_system_test_case"

class SignInsTest < ApplicationSystemTestCase
  test "user sign in and sign out" do
    mika = users(:mika)
    login(mika.email, "tanjapassword")
    assert_content "Uspešno ste se prijavili"

    click_link "Odjavi se"
    assert_content "Uspešno ste se odjavili"
    assert_link "Prijavi se"
  end

  test "invalid email" do
    login("nina@examople,com", "ninapassword")
    assert_content "Prijava nije uspela"
    assert_link "Prijavi se"
  end

  test "invalid password" do
    mika = users(:mika)
    login(mika.email, "wrongpassword")
    assert_content "Prijava nije uspela"
    assert_link "Prijavi se"
  end
end
