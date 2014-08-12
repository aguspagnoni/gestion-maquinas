class ChangeRepairmentAttribute < ActiveRecord::Migration
  def change
    change_column :repairments, "comment", :text
  end
end
