class AddColumnsToLocations < ActiveRecord::Migration
  def change
  	add_column :locations, "short_name", :string
  	add_column :locations, "address", :string
  end
end
