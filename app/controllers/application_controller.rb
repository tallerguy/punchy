class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  respond_to :html, :js, :json

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :password, :password_confirmation])
  end

  def layout_by_resource
    if !current_user.present?
      'devise'
    else
      'application'
    end
  end

  def record_not_found
    flash[:error] = "The record you are looking for does not exist"
    redirect_to authenticated_root_path
  end
end
