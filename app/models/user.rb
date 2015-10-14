require 'lib/twitter_client'

class User < ActiveRecord::Base
  #Validations
  validates :name, presence: true

  #Associations
  has_many :pets
  has_many :tweets

  def self.find_or_create_user(auth_hash)
    uid = auth_hash.uid

    user = User.where(provider: auth_hash.provider, uid: uid).first_or_initialize

    user.update(
      nickname: auth_hash.info.nickname,
      name: auth_hash.info.name,
      profile_image: auth_hash.info.image,
      token: auth_hash.credentials.token,
      secret: auth_hash.credentials.secret
      )

    return user.save ? user : nil
  end
end
