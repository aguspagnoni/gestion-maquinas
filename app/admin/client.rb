ActiveAdmin.register Client do

  menu parent: "Clientes", label: proc { t('clients') }

  controller do
    def permitted_params
      params.permit!
    end
  end

  index title: proc { t('clients') } do
    column t('company_name'), :company_name
    column t('cuit'), :cuit
    column t('address'), :address
    column t('telephone'), :telephone
    column :email
    actions
  end

  form do |f|
    f.inputs do
      f.input :company_name
      f.input :cuit
      f.input :address
      f.input :telephone
      f.input :email
      f.has_many :locations, allow_destroy: true, heading: t('location') do |location|
        # location.input :client_id, as: :select, collection: Client.pluck(:company_name, :id)
        location.input :short_name, label: t('short_name')
        location.input :address, label: t('address')
        location.has_many :positions, allow_destroy: true, heading: t('position') do |position|
          position.input :name, label: t(:name)
        end
      end
    end
    f.actions
  end

  show title: proc { t('clients') } do |client|
    attributes_table do
      row(t('cuit')) { client.cuit }
      row(t('address')) { client.address }
      row(t('telephone')) { client.telephone }
      row :email
      row(t('created_at')) { client.created_at }
      row(t('updated_at')) { client.updated_at }
    end
    active_admin_comments
  end
end
