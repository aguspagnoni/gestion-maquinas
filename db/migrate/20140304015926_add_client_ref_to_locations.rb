class AddClientRefToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :client, index: true
  end
end
