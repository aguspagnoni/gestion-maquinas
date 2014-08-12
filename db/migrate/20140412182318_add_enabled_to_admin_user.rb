class AddEnabledToAdminUser < ActiveRecord::Migration
  def change
    add_column :admin_users, :enabled, :boolean
  end
end
