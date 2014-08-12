ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "#{t('recent_changes')}" do
          table_for PaperTrail::Version.order('id desc').limit(3) do
            column("Item") { |v| auto_link v.item, v.item.admin_history_info(v) }
            column("Tipo") { |v| v.item_type.underscore.humanize }
            column("Evento") { |v| v.event.humanize }
            column("Fecha de modificación") { |v| v.created_at.to_s :long }
            column("Usuario") { |v| link_to AdminUser.find(v.whodunnit).email, admin_admin_user_path(AdminUser.find(v.whodunnit)) }
          end
        end # panel
      end # column
    end # columns

  end # content
end
