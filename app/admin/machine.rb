ActiveAdmin.register Machine do

  menu parent: "Servicios", label: proc { t('machines') }

  sidebar "historia", :partial => "layouts/version", :only => :show

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

  permit_params :category_id, :position_id, :code, :model, :active_since
end
