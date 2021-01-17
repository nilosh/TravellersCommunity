class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_breadcrumb

  protected

  # Configure new parameters for devise users.
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :gender, :dob])
    devise_parameter_sanitizer.permit(:account_update, keys: [:full_name, :gender, 
      :dob, :avatar, images: [], remove_photo: [] ])
  end

  # Defines the path to follow after sign up.
  def after_sign_up_path_for(user)
    set_tab :profile
    users_home_path
  end

  # Defines the path to follow after sign in. If role is admin,
  # direct to the active admin dashboard.
  def after_sign_in_path_for(user)
    if current_user.role_id == 1
      admin_dashboard_path
    else
      home_path
    end
  end

  # Authenticating the user to admin page
  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.role_id == 1
      flash[:alert] = "Unauthorized Access!"
      redirect_to_root_path
    end
  end

  # This method defines adding a breadcrumb.
  def add_breadcrumb(label, path = nil)
    @breadcrumbs << {
      label: label,
      path: path
    }
  end

  # This method initializes an empty array to hold the breadcrumb paths.
  def set_breadcrumb
    @breadcrumbs = []
  end

  # This method handles the deletion of images attached by the user.
  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_back(fallback_location: request.referer)
    # @user.images.find_by(params[:attachment_id]).purge
  end
  

end
