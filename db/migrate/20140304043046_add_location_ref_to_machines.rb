class AddLocationRefToMachines < ActiveRecord::Migration
  def change
    add_reference :machines, :location, index: true
  end
end
