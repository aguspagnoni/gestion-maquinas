ActiveAdmin.register Provider do

  menu parent: I18n.t('service_provider'), label: I18n.t('provider')

  permit_params :name

  filter :name, label: I18n.t('name')

end
