class AddDefaultToPartCount < ActiveRecord::Migration
  def change
    change_column :parts, "count", :integer, default: 1
  end
end
