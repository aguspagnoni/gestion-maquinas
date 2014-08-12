ActiveAdmin.register Location do

  menu parent: "Clientes", label: proc { t('locations') }

  permit_params :client_id, :short_name, :address

  form do |f|
    f.inputs do
      f.input :client_id, as: :select, collection: Client.pluck(:company_name, :id)
      f.input :short_name, label: t('short_name')
      f.input :address, label: t('address')
    end
    f.actions
  end

  index title: proc { t('locations') } do
    column t('client') do |location|
      auto_link Client.find location.client_id
    end
    column t('short_name'), :short_name
    column t('address'), :address
    default_actions
  end
end
