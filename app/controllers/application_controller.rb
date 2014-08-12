class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def admin_enabled?
    if !current_admin_user.nil? && !current_admin_user.enabled?
      sign_out(current_admin_user)
      flash[:alert] = "Tu cuenta no esta habilitada"
    end
  end
end
