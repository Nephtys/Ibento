class AddEventIdToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :event_id, :integer
  end

  def self.down
    remove_column :teams, :event_id
  end
end
