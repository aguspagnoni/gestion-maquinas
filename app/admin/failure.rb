ActiveAdmin.register Failure do

  menu parent: "Clientes", label: proc { t('failures') }

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:failure).permit! ]
    end
  end

  form do |f|
    f.inputs do
      f.input :client, label: t('client'), as: :select, collection: get_entries(Client.all, :custom_title), include_blank: false
      f.input :since, label: t('since'), as: :just_datetime_picker
      f.input :details, label: t('details')
    end
    f.actions
  end

  show do |failure|
    attributes_table do
      row(t('client')) { failure.client }
      row(t('since')) { failure.since }
      row(t('details')) { failure.details }
    end
  end

  index title: I18n.t('failures') do
    column t('client'), :client
    column t('since'), :since
    column t('details'), :details
    actions
  end

end
