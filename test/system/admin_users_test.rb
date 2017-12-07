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
end
