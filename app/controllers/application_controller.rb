class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :logged_in_user

  include SessionsHelper

  def admin_only
    return true if current_user.admin?
    flash[:alert] = 'You are not authorised to do that.'
    redirect_to root_path
  end

  # TODO: spec for this
  def logged_in_user
    return if logged_in?
    store_location
    redirect_to sessions_new_path, alert: 'Please log in.'
  end

  # TODO: spec for this
  def redirect_back_or(location)
    redirect_to(session[:return_to] || location)
    session.delete(:return_to)
  end

  # TODO: spec for this
  def store_location
    session[:return_to] = request.url if request.get?
  end
end
