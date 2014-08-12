class AddColumnsToFailure < ActiveRecord::Migration
  def change
  	add_column :failures, "since", :datetime
  	add_column :failures, "details", :string
  end
end
