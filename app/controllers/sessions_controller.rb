class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token unless Rails.env.production?

  def create
    auth_hash = request.env['omniauth.auth']
    raise
  end

end
