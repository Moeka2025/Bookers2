class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :redirect_logged_in_user_from_login, if: :devise_controller?
  before_action :authenticate_user!, except: [:top, :about]

  def after_sign_in_path_for(resource)
    user_path(resource)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def redirect_logged_in_user_from_login
    if user_signed_in? && request.path == new_user_session_path
      redirect_to user_path(current_user), notice: "Signed in successfully."
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end