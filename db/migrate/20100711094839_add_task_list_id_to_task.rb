class AddTaskListIdToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :task_list_id, :integer
  end

  def self.down
    remove_column :tasks, :task_list_id
  end
end
