class UsersController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @pets = @user.pets
  end
end
