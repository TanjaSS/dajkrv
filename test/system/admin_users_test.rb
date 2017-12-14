require "application_system_test_case"

class AdminUsersTest < ApplicationSystemTestCase
  test "admin can see all users" do
    mika = users(:mika)
    nika = users(:nika)
    admin = users(:admin)
    login(admin.email, "tanjapassword")
    visit admin_users_path
    assert_content mika.email
    assert_content nika.email
    assert_content admin.email
  end

  test "normal user can't see all users" do
    mika = users(:mika)
    login(mika.email, "tanjapassword")
    visit admin_users_path
    assert_content "The page you were looking for doesn't exist."
  end

  test "admin can see user details" do
    mika = users(:mika)
    mika.update(last_donation_at: Date.today)
    admin = users(:admin)
    login(admin.email, "tanjapassword")
    visit admin_users_path
    click_link mika.email
    assert_content mika.email
    assert_content mika.id
    assert_content mika.period
    assert_content mika.last_donation_at
  end

  test "admin can delete users" do
    mika = users(:mika)
    admin = users(:admin)
    login(admin.email, "tanjapassword")
    visit admin_users_path
    assert_content mika.email
    within "#user-#{mika.id}" do
      click_link "Delete"
    end
    assert_no_content mika.email
    assert_content "Korisnik je uspešno obrisan"
  end
end
