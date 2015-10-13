class Pet < ActiveRecord::Base
  #Validations
  validates :name, presence: true

  #Associations
  belongs_to :user
  has_many :feedings
end
