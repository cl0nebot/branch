class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :devise_strong_parameters, :if => :devise_controller?

  protected

  def devise_strong_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
