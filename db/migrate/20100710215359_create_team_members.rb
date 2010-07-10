class CreateTeamMembers < ActiveRecord::Migration
  def self.up
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :user_id
      t.integer :auth_level

      t.timestamps
    end
  end

  def self.down
    drop_table :team_members
  end
end
