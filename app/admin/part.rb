ActiveAdmin.register Part do

  menu parent: "Proveedor de Servicios", label: proc { t('parts') }

  permit_params :code, :provider, :purchased_at, :description, :repairment_id

end
