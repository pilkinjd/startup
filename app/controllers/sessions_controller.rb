class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      reset_session
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash[:action] = 'Invalid username/password combination'
      render :new
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
