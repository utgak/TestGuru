class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :save_path

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:path]
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
