ActiveAdmin.register Repairment do
  include Rails.application.routes.url_helpers

  menu parent: I18n.t('service_provider'), label: proc { t('repairments') }

  # collection_action :autocomplete_parts_code, method: :get

  controller do
    # autocomplete :parts, :code, full: true

    def resource_params
      return [] if request.get?
      [ params.require(:repairment).permit! ]
      # [ params.require(:repairment).permit(:comment,
      #                                    :finished_at,
      #                                    :started_at,
      #                                    :state,
      #                                    :machine_id,
      #                                    technician_ids: [],
      #                                    parts_attributes: [:id]) ]
    end
  end

  filter :parts, label: I18n.t('parts')
  filter :machine, label: I18n.t('machine')
  filter :technicians, label: I18n.t('technicians')
  filter :comment, label: I18n.t('comment')
  filter :state, label: I18n.t('state')
  filter :started_at, label: I18n.t('started_at')
  filter :finished_at, label: I18n.t('finished_at')
  # filter :last_sign_in_at, label: I18n.t('last_sign_in_at')
  # filter :sign_in_count, label: I18n.t('sign_in_count')
  # filter :created_at, label: I18n.t('created_at')

  form do |f|
    f.inputs "Partes utilizadas en esta reparación" do
      "<div class=\"active-form-div\">#{Part.where(repairment_id: params[:id]).map {|p| p.code }.join(',')}</div>".html_safe
    end
    f.inputs do
      f.input :machine_id, label: t('machine'), as: :select, collection: Machine.all
      f.input :parts, as: :select, multiple: true,
        collection: Part.unused.order('code ASC'),
        input_html: { class: 'chosen' }
      f.input :technicians, as: :select, multiple: true,
        collection: Technician.all.order('first_name DESC'),
        input_html: { class: 'chosen' }
      f.input :comment, label: t('comment')
      f.input :state, as: :select, collection: Repairment.states, include_blank: false
      f.input :started_at, label: t('started_at'), as: :just_datetime_picker
      f.input :finished_at, label: t('finished_at'), as: :just_datetime_picker
    end
    f.actions
  end

  index title: I18n.t('repairments') do
    column t('machine'), :machine
    column t('comment'), :comment
    column t('state'), :state
    column t('started_at'), :started_at
    column t('finished_at'), :finished_at
  end

end
