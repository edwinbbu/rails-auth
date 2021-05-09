# frozen_string_literal: true

require "test_helper"

class UserTest < ActiveSupport::TestCase

  setup do
    @user = User.new()
  end

  def test_user_should_be_not_be_valid_without_name
    @user.name = ''
    assert_not @user.valid?
    assert_equal ["Name can't be blank"], @user.errors.full_messages
  end

  def test_name_should_be_of_valid_length
    @user.name = 'a' * 50
    assert @user.invalid?
  end
end
