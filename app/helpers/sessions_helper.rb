module SessionsHelper
  def logged_in?
    session[:current_user_id].present?
  end
end
