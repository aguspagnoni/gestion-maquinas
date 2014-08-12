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

  show title: proc { t('clients') } do
    attributes_table do
      row :cuit, label: t('cuit')
      row :address, label: t('address')
      row :telephone, label: t('telephone')
      row :email
      row :created_at, label: t('created_at')
      row :updated_at, label: t('updated_at')
    end
    active_admin_comments
  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
