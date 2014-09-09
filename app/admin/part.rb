ActiveAdmin.register Part do

  menu parent: I18n.t('service_provider'), label: proc { t('parts') }

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:part).permit! ]
    end
  end

  permit_params :code, :provider, :purchased_at, :description

  filter :code, label: I18n.t('code')
  filter :purchased_at, label: I18n.t('purchased_at')
  filter :provider, label: I18n.t('provider')
  filter :description, label: I18n.t('description')

  index title: I18n.t('parts') do
    column t('code'), :code
    column t('provider_code'), :provider_code
    column t('purchased_at'), :purchased_at
    column t('provider'), :provider
    column t('description'), :description
    actions
  end

  form do |f|
    f.inputs do
      f.input :code, label: t('code')
      f.input :provider_code, label: t('provider_code')
      f.input :count, label: t('count')
      f.input :purchased_at, label: t('purchased_at'), as: :just_datetime_picker
      f.input :provider, label: t('provider'), input_html: { class: 'chosen' }
      f.input :description, label: t('description')
    end
    f.actions
  end

  show title: I18n.t('parts') do |part|
    attributes_table do
      row(t('code')) { part.code }
      row(t('provider_code')) { part.provider_code }
      row(t('count')) { part.count.to_s }
      row(t('purchased_at')) { part.purchased_at }
      row(t('provider')) { part.provider }
      row(t('description')) { part.description }
    end
    active_admin_comments
  end

end
