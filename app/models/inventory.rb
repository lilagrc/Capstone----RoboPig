class Inventory < ActiveRecord::Base
  # Validations
  validates :pet_id, uniqueness: true

  # Associations
  belongs_to :pet
end
