class TwitterClient
  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CLIENT_ID"]
      config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end
  end
end
