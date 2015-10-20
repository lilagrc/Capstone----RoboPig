class Api::ApiController < ActionController::Base

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      User.exists?(api_key: token)
    end
  end
end

