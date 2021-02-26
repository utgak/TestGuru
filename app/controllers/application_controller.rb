class ApplicationController < ActionController::Base
  before_action :save_path, unless: :logged_in?
  before_action :authenticate_user!

  helper_method :current_user,
                :logged_in?

  private

  def save_path
    cookies[:path] = request.fullpath
    cookies[:path] = root_path if cookies[:path] == signup_path
  end

  def authenticate_user!
    unless current_user
      redirect_to login_path, alert: 'Are you Guru? Verify your Email and Password please'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
