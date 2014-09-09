ActiveAdmin.register Category do

  menu parent: "Servicios", label: proc { t('categories') }

  permit_params :name

  filter :name, label: I18n.t('name')

end
