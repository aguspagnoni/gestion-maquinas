ActiveAdmin.register Position do

  menu parent: "Clientes", label: proc { t('positions') }

  index title: I18n.t('positions') do
    column t('name'), :name
    column t('created_at'), :created_at
    column t('updated_at'), :updated_at
    actions
  end

  show do |pos|
    attributes_table do
      row(t('name')) { pos.name }
      row(t('created_at')) { pos.created_at }
      row(t('updated_at')) { pos.updated_at }
      row(t('location')) { pos.location }
    end
  end

end
