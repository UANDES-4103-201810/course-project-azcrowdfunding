class ApplicationController < ActionController::Base

  add_flash_types :success, :warning, :danger, :info

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :avatar, :first_name, :last_name, :phone, :address, :country, :city])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :current_password, :first_name, :last_name, :avatar, :phone, :address, :country, :city])
  end
end
