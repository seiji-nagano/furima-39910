class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:real_last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:real_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:main_last_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:main_first_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:date_of_birth])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
    end
  end
end
