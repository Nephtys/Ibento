class AddIsLeadingToTeam < ActiveRecord::Migration
  def self.up
    add_column :teams, :is_leading, :boolean
  end

  def self.down
    remove_column :teams, :is_leading
  end
end
