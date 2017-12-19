require "application_system_test_case"

class DeleteAccountsTest < ApplicationSystemTestCase
  test "delete account" do
    mika = users(:mika)
    login(mika.email, "tanjapassword")
    click_link "Obriši nalog"
    accept_confirm "Da li ste sigurni?"
    assert_content "Uspešno ste obrisali nalog"
    assert_link "Prijavi se"
  end
end
