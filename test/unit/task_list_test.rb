require 'test_helper'

class TaskListTest < ActiveSupport::TestCase

  test "task_list attributes must not be empty" do
    task_list = TaskList.new
    assert task_list.invalid?
    assert task_list.errors[:title].any?
    assert task_list.errors[:event].any?
  end

end
