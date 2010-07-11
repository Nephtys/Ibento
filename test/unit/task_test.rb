require 'test_helper'

class TaskTest < ActiveSupport::TestCase

  test "task attributes must not be empty" do
    task = Task.new
    assert task.invalid?
    assert task.errors[:title].any?
    assert task.errors[:task_list].any?
  end

end
