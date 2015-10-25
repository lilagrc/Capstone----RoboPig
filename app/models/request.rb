class Request < ActiveRecord::Base
  belongs_to :pet

  validates :pet_id, presence: true
end
