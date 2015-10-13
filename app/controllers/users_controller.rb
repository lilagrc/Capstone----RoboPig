class UsersController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    raise
  end
end
