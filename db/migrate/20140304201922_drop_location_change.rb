class DropLocationChange < ActiveRecord::Migration
  def down
  	drop_table :location_changes
  end
end
