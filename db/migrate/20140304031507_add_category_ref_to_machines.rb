class AddCategoryRefToMachines < ActiveRecord::Migration
  def change
    add_reference :machines, :category, index: true
  end
end
