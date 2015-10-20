class User < ActiveRecord::Base
  # Validations
  validates :name, presence: true

  # Associations
  has_many :pets

  # Callbacks
  # before_create do |user|
  #   user.api_key = user.generate_api_key
  # end

  def self.find_or_create_user(auth_hash)
    uid = auth_hash.uid

    if User.find_by(uid: uid)
      user = User.find_by(uid: uid)
    else user = User.create(
      nickname: auth_hash.info.nickname,
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
      )
      user.api_key = generate_api_key
      user.save
    end
    return user
  end

  def twitter
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CLIENT_ID"]
      config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token        = token
      config.access_token_secret = secret
    end
  end

  def generate_api_key
      token = SecureRandom.base64.tr('+/=', 'Qrt')
  end
end
