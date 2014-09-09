ActiveAdmin.register_page "Machine History" do

  menu label: proc{ t('history_machines') }

  content title: proc{ t('history_machines') } do
    # div class: "blank_slate_container" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "#{t('all_changes')}" do
          table_for PaperTrail::Version.order('id desc') do
            column("Item") do |v|
              # if v.event == 'destroy'
                # link_to "Se eliminó #{ v.reify.try(:model) }, revertir", revert_version_path(v), method: :post
              if v.item.present?
                link_to v.item.admin_history_info(v), history_admin_machine_path(v.item)
              else
                I18n.t('deleted_item')
              end
            end
            column("Tipo") { |v| v.item_type.underscore.humanize }
            column("Evento") { |v| I18n.t(v.event).humanize }
            column("Fecha de modificación") { |v| v.created_at.to_s :long }
            column("Usuario") { |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(AdminUser.find(v.whodunnit)) }
          end
        end # panel
      end
    end
  end # content
end
