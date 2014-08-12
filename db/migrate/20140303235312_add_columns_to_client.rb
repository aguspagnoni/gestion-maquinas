class AddColumnsToClient < ActiveRecord::Migration
  def change
  	add_column :clients, "company_name", :string
  	add_column :clients, "cuit", :string
  	add_column :clients, "address", :string
  	add_column :clients, "telephone", :string
  	add_column :clients, "email", :string
  end
end
