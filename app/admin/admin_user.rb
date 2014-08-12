ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation, :enabled

  collection_action :autocomplete_admin_user_email, :method => :get

  controller do
      autocomplete :admin_user, :email

    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end

  index do
    selectable_column
    column :email
    column t('last_sign_in_at'), :last_sign_in_at
    column t('created_at'), :created_at
    actions
  end

  filter :email
  filter :last_sign_in_at, label: I18n.t('last_sign_in_at')
  filter :sign_in_count, label: I18n.t('sign_in_count')
  filter :created_at, label: I18n.t('created_at')

  show do
    panel "Admin User" do
      attributes_table_for admin_user do
        row("Email") { admin_user.email }
        row("Status") { status_tag (admin_user.enabled ? "Enabled" : "Disabled"), (admin_user.enabled ? :ok : :error) }
        row(t('last_sign_in_at')) { admin_user.last_sign_in_at }
        row(t('created_at')) { admin_user.created_at }
      end
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email, :as => :autocomplete, :url => autocomplete_admin_user_email_admin_admin_users_path
      f.input :password
      f.input :password_confirmation
      f.input :enabled, label: t('enabled')
    end
    f.actions
  end

end
