module ApplicationHelper
  def logged_in?
    unless session[:user_id] == nil
      return true
    end
  end
end
