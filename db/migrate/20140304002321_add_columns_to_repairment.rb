class AddColumnsToRepairment < ActiveRecord::Migration
  def change
  	add_column :repairments, "started_at", :datetime
  	add_column :repairments, "finished_at", :datetime
  	add_column :repairments, "state", :string
  	add_column :repairments, "comment", :string
  end
end
