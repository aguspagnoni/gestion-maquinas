class AddMachineRefToRepairments < ActiveRecord::Migration
  def change
    add_reference :repairments, :machine, index: true
  end
end
