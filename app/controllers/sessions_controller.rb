class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token unless Rails.env.production?

  def create
    auth_hash = request.env['omniauth.auth']

    if auth_hash["uid"]
      @user = User.find_or_create_user(auth_hash)

      if @user
        session[:user_id] = @user.id
      end

      redirect_to root_path
    else
      flash[:error] = "Failed to authenticate"

      redirect_to root_path
    end
  end

end
