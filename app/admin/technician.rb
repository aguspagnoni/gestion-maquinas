ActiveAdmin.register Technician do

  menu parent: "Proveedor de Servicios", label: proc { t('technicians') }

  permit_params :first_name, :last_name, :dni, :cuit, :birthdate, :cellphone, :telephone, :address, :email

  show do
    attributes_table :first_name, :last_name, :dni, :cuit, :birthdate, :cellphone, :telephone, :address, :email
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :dni
      f.input :cuit
      f.input :birthdate
      f.input :cellphone
      f.input :telephone
      f.input :address
      f.input :email
    end
    f.actions
  end
end
