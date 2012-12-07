require 'test_helper'

class UserTest < ActiveSupport::TestCase

    test "not be able to create User account without password" do
      user = User.new(:email => "tester@gmail.com")
      user.save

      assert !user.valid?, user.errors.to_s
    end

    test "not be able to create User account without e-mail" do
      user = User.new(:password => "fffffff" , :password_confirmation => "fffffff")
      user.save

      assert !user.valid?, user.errors.to_s
    end
end