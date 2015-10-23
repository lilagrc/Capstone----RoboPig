class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(session[:user_id])
    @pets = @user.pets
  end
end
