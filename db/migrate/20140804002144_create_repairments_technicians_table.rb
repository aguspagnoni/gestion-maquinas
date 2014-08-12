class CreateRepairmentsTechniciansTable < ActiveRecord::Migration
  def change
    create_join_table :repairments, :technicians do |t|
      t.index :repairment_id
      t.index :technician_id
    end
  end
end
