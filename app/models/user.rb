class User < ActiveRecord::Base
  # Validations
  validates :name, presence: true

  # Associations
  belongs_to :pets

  def self.find_or_create_user(auth_hash)
    uid = auth_hash.uid

    if User.find_by(uid: uid)
      user = User.find_by(uid: uid)
    elsif user = User.create(
      uid: uid,
      nickname: auth_hash.info.nickname,
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
      )

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

end
