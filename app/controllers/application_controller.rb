class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_admin

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update,  keys: [:last_name, :first_name, :avatar])
    devise_parameter_sanitizer.permit(:invite,  keys: [:last_name, :first_name, :department_id, :level])
    devise_parameter_sanitizer.permit(:accept_invitation,  keys: [:last_name, :first_name, :avatar])
  end

  def not_admin
    flash[:alert] = "You are not admin"
    redirect_to root_path
  end
end
