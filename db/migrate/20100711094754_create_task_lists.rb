class CreateTaskLists < ActiveRecord::Migration
  def self.up
    create_table :task_lists do |t|
      t.string :title
      t.text :description
      t.integer :event_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :task_lists
  end
end
