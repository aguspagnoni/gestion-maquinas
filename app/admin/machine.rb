ActiveAdmin.register Machine do

  menu parent: "Servicios", label: proc { t('machines') }

  sidebar "historia", :partial => "layouts/version", :only => :show

  controller do
    def resource_params
      return [] if request.get?
      [ params.require(:machine).permit! ]
    end
  end

  filter :category, label: I18n.t('category')
  filter :model, label: I18n.t('model')
  filter :code, label: I18n.t('code')
  filter :position, label: I18n.t('place')
  filter :active_since, label: I18n.t('active_since')

  member_action :history do
    @machine = Machine.find(params[:id])
    @versions = @machine.versions
    render "layouts/machine_history"
  end

  action_item only: :show do
    link_to 'Ver Historia Completa', history_admin_machine_path(Machine.find(params[:id]))
  end

  controller do
    def show
      @machine = Machine.find(params[:id])
      @versions = @machine.versions
      @machine = @machine.versions[params[:version].to_i].reify if params[:version]
      # show!
    end

    def user_for_paper_trail
      admin_user_signed_in? ? current_admin_user : 'Unknown user'
    end
  end

  index title: I18n.t('machines') do |a|
    column t('model'), :model
    column t('code'), :code
    column t('place'), :position
    column t('active_since'), :active_since
    column t('updated_at'), :updated_at
    actions
  end

  show title: I18n.t('machine') do |machine|
    attributes_table do
      row(t('category')) { machine.category }
      row(t('model')) { machine.model }
      row(t('code')) { machine.code }
      row(t('client')) { machine.client }
      row(t('location')) { machine.location }
      row(t('position')) { machine.position.name }
      row(t('active_since')) { machine.active_since }
      row(t('created_at')) { machine.created_at }
      row(t('updated_at')) { machine.updated_at }
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :category, label: t('category')
      f.input :position, as: :select, input_html: { class: 'chosen' }, label: t('place'),
                  collection: Position.all.map { |p| [p.custom_title, p.id] }
      f.input :model, label: t('model')
      f.input :code, label: t('code')
      f.input :active_since, label: t('label'), as: :just_datetime_picker

    end
    f.actions
  end
end
