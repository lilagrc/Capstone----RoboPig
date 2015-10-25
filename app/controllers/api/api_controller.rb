class Api::ApiController < ActionController::Base

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      Pet.exists?(api_key: token)
    end
  end
end

