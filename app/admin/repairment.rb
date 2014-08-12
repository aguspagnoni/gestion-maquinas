ActiveAdmin.register Repairment do
  include Rails.application.routes.url_helpers

  menu parent: "Proveedor de Servicios", label: proc { t('repairments') }

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




  form do |f|
    f.inputs "Partes utilizadas en esta reparación" do
      "<div class=\"active-form-div\">#{Part.where(repairment_id: params[:id]).map {|p| p.code }.join(',')}</div>".html_safe
    end
    f.inputs do
      f.input :machine_id, label: t('machine'), as: :select, collection: Hash[Machine.all.map { |m| [m.custom_title, m.id] }]
      f.input :parts, as: :select, multiple: true,
        collection: Hash[Part.unused.order('code ASC').map { |m| [m.code, m.id] }],
        input_html: { class: 'chosen' }
      f.input :technicians, as: :select, multiple: true,
        collection: Hash[Technician.all.order('first_name DESC').map { |t| [t.first_name, t.id] }],
        input_html: { class: 'chosen' }
      f.input :comment, label: t('comment')
      f.input :state, as: :select, collection: Repairment.states, include_blank: false
      f.input :started_at, label: t('started_at'), as: :just_datetime_picker
      f.input :finished_at, label: t('finished_at'), as: :just_datetime_picker
    end
    f.actions
  end

end
