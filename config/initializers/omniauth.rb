# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV["TWITTER_CLIENT_ID"], ENV["TWITTER_CLIENT_SECRET"],   {
      :secure_image_url => 'true',
      :image_size => 'original',
      :use_authorize => 'true'
      }
end
