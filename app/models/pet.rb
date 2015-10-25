class Pet < ActiveRecord::Base
  #Validations
  validates :name, presence: true

  #Associations
  has_many :users
  has_many :feedings
  has_many :requests

  def self.generate_api_key
      token = SecureRandom.base64.tr('+/=', 'Qrt')
  end

end
