require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
    user = User.new
    assert user.invalid?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
    assert user.errors[:first_name].any?
    assert user.errors[:last_name].any?
  end
end
