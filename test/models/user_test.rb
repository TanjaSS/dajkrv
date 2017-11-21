require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "tanja@example.com",
                     password: "password",
                     password_confirmation: "password")
  end

  test "valid user" do
    assert @user.valid?
  end

  test "presence of email" do
    @user.email = ""
    assert_not @user.valid?
    assert @user.errors[:email].present?
  end
end
