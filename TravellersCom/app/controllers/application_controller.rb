class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :gender, :dob])
  end

  def after_sign_up_path_for(user)
    users_home_path
  end

  def after_sign_in_path_for(user)
    if current_user.role_id == 1
      admin_dashboard_path
    else
      users_home_path
    end
    
  end

end
