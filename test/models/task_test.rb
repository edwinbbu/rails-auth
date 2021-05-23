require "test_helper"

class TaskTest < ActiveSupport::TestCase

  def setup 
    @user = User.create(name: 'Oliver', email: 'oliver@example.com', password: 'welcome', password_confirmation: 'welcome')
  end

  def test_instance_of_task
    task = Task.new

    assert_instance_of Task, task
  end

  def test_name_and_description_of_task
    task = Task.new(name: "Name", description: "Description")

    assert_equal task.name, "Name"
    assert_equal task.description, "Description"
  end

  def test_value_created_at
    task = Task.new(name: "Name", description: "Description", user: @user)
    assert_nil task.created_at

    task.save!
    assert_not_nil task.created_at
  end

  def test_error_raised
    assert_raises ActiveRecord::RecordNotFound do
      Task.find(SecureRandom.uuid)
    end
  end

  def test_count_of_number_of_tasks
    assert_difference ['Task.count'], 2 do
      Task.create!(name:'Name', description: 'Creating a task through test', user: @user)
      Task.create!(name:'Name2', description: 'Creating another task through test', user: @user)
    end
  end

end