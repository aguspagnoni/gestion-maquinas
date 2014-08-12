class AddColumnsToMachine < ActiveRecord::Migration
  def change
  	add_column :machines, "code", :string
  	add_column :machines, "model", :string
  	add_column :machines, "active_since", :date
  end
end
