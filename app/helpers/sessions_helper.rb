module SessionsHelper
  def current_user
    return unless session[:current_user_id]
    @current_user ||= User.find(session[:current_user_id])
  end

  def logged_in?
    session[:current_user_id].present?
  end

  def sign_in(user)
    session[:current_user_id] = user.id
  end

  def sign_out
    session[:current_user_id] = nil
    @current_user = nil
  end
end
