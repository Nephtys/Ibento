class AddGeoMapIdToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :geo_map_id, :integer
  end

  def self.down
    remove_column :events, :geo_map_id
  end
end
