class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Call the configure_permitted_parameters method if we're in a devise controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #Workaround so that we can use other attributes in our user model, which was generated by devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:full_name, :profile_name, :email, :password, :level, :avatar)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:profile_name, :email, :password, :password_confirmation, :level, :avatar, :current_password)}
  end
end