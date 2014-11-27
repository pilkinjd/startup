module SessionsHelper
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
