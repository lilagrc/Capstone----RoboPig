class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def require_login
    redirect_to login_path, flash: {error: MESSAGES[:not_logged_in]} unless session[:user_id]
  end

end
