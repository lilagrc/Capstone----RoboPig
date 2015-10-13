class User < ActiveRecord::Base
  #Validations
  validates :name, presence: true
  validates :email, presence: true

  #Associations
  has_many :pets

  def self.find_or_create_user(auth_hash)
    uid = auth_hash["uid"]

    user = User.where(id: uid).first_or_initialize
    user.email = auth_hash["info"]["email"]
    user.name = auth_hash["info"]["name"]

    return user.save ? user : nil
  end
end
