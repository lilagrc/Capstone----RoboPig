class Request < ActiveRecord::Base
  # Associations
  belongs_to :pet

  # Validations
  validates :pet_id, presence: true
end
