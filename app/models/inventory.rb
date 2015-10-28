class Inventory < ActiveRecord::Base
  validates :pet_id, uniqueness: true

  belongs_to :pet
end
