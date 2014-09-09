class AddProviderRefToParts < ActiveRecord::Migration
  def change
    add_reference :parts, :provider, index: true
  end
end
