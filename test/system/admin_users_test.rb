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
end
