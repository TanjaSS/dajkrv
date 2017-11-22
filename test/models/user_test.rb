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
    @user.email = nil
    assert_not @user.valid?
    assert @user.errors[:email].present?
  end

  test "downcase email" do
    @user.email = "TANJA@EXAMPLE.COM"
    @user.save!
    assert_equal "tanja@example.com", @user.email
  end

  test "email uniquness" do
    @user.save!
    user2 = User.new(email: "Tanja@example.com",
                     password: "password",
                     password_confirmation: "password")
    assert_not user2.valid?
    assert user2.errors[:email].present?
  end

  test "presence of password" do
    @user.password = nil
    assert_not @user.valid?
    assert @user.errors[:password].present?
  end

  test "password should match confiramtion" do
    @user.password_confirmation = "secret"
    assert_not @user.valid?
    assert @user.errors[:password_confirmation].present?
  end

end
