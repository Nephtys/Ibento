class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.datetime :begining_at
      t.datetime :ending_at
      t.text :abstract
      t.text :full_description

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
