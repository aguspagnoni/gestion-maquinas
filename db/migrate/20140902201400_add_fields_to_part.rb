class AddFieldsToPart < ActiveRecord::Migration
  def change
    add_column :parts, "count", :integer
    add_column :parts, "provider_code", :string
  end
end
