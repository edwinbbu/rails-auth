# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase

  def test_instance_of_user
    user = User.new
    assert_instance_of User, user
  end

  def test_user_should_be_not_be_valid_without_name
    user = User.new(name: '', email: 'oliver@example.com', password: 'welcome', password_confirmation: 'welcome')
    assert_not user.valid?
    assert_equal ["Name can't be blank"], user.errors.full_messages
  end

  def test_name_should_be_of_valid_length
    user = User.new()
    user.name = 'a' * 50
    assert user.invalid?
  end
end
