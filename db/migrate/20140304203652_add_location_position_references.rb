class AddLocationPositionReferences < ActiveRecord::Migration
  def change
  	remove_column :machines, :location_id
  	add_reference :machines, :position, index: true
  	add_reference :positions, :location, index: true
  end
end
