class CreateGeoMaps < ActiveRecord::Migration
  def self.up
    create_table :geo_maps do |t|
      t.string :address
      t.string :link
      t.integer :width
      t.integer :zoom

      t.timestamps
    end
  end

  def self.down
    drop_table :geo_maps
  end
end
