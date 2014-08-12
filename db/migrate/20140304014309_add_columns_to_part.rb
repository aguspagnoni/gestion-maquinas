class AddColumnsToPart < ActiveRecord::Migration
  def change
  	add_column :parts, "code", :string
  	add_column :parts, "purchased_at", :datetime
  	add_column :parts, "provider", :string
  	add_column :parts, "description", :string
  end
end
