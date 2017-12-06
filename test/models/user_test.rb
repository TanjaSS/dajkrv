require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(email: "tanja@example.com",
                     password: "password",
                     password_confirmation: "password",
                     period: 6)
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

  test "format email" do
    @user.email = "tanja@example,com"
    assert_not @user.valid?
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

  test "presence of period" do
    @user.period = nil
    assert_not @user.valid?
    assert @user.errors[:period].present?
  end

  test "#send_reminder?" do
    @user.last_donation_at = Date.today
    assert_not @user.send_reminder?

    @user.last_donation_at = 5.months.ago
    assert_not @user.send_reminder?

    @user.last_donation_at = 6.months.ago
    assert @user.send_reminder?
  end

  test ".to_remind" do
    mika = users(:mika)
    nika = users(:nika)

    mika.update!(last_donation_at: 4.months.ago)
    nika.update!(last_donation_at: 2.months.ago)

    assert_equal [mika], User.to_remind
  end

  test "#days_since_last_donation" do
    @user.last_donation_at = 5.days.ago
    assert_equal 5, @user.days_since_last_donation
  end

  test "#make_admin" do
    mika = users(:mika)
    mika.make_admin

    assert mika.admin?

    mika.reload

    assert mika.admin?
  end

end
