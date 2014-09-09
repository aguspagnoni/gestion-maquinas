ActiveAdmin.register Technician do

  menu parent: I18n.t('service_provider'), label: proc { t('technicians') }

  permit_params :first_name, :last_name, :dni, :cuit, :birthdate, :cellphone, :telephone, :address, :email

  filter :email
  filter :last_name, label: I18n.t('last_name')
  filter :first_name, label: I18n.t('first_name')
  filter :cellphone, label: I18n.t('cellphone')
  filter :telephone, label: I18n.t('telephone')

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

  index title: I18n.t('technicians') do
    column t('first_name'), :full_name
    column t('email'), :email
    column t('cellphone'), :cellphone
    column t('telephone'), :telephone
    column t('address'), :address
  end
end
