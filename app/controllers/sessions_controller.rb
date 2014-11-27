class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: [:new, :create, :destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      reset_session
      sign_in(user)
      redirect_back_or root_path
    else
      flash.now[:action] = 'Invalid username/password combination'
      render :new
    end
  end

  def destroy
    sign_out if logged_in?
    redirect_to root_path
  end
end
