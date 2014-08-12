class AddColumnsToTechnician < ActiveRecord::Migration
  def change
  	add_column :technicians, "first_name", :string
  	add_column :technicians, "last_name", :string
  	add_column :technicians, "dni", :string
  	add_column :technicians, "cuit", :string
  	add_column :technicians, "birthdate", :date
  	add_column :technicians, "email", :string
  	add_column :technicians, "cellphone", :string
  	add_column :technicians, "telephone", :string
  	add_column :technicians, "address", :string
  end
end
