class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    redirect_to root_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if cookies[:before_login_path]
        redirect_to cookies[:before_login_path]
      else
        redirect_to root_path
      end
    else
      flash.now[:alert] = 'Are you Guru? Verify your Email and Password please'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end
end
