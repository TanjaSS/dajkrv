require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "presence of email" do
    user = User.new
    user.validate

    assert user.errors[:email].present?

    user.email = "tanja@example.com"
    user.validate
    
    assert user.errors[:email].blank?
  end
end
