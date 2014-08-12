class CreateRepairments < ActiveRecord::Migration
  def change
    create_table :repairments do |t|

      t.timestamps
    end
  end
end
