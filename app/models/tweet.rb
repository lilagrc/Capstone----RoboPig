class Tweet < ActiveRecord::Base
  # belongs_to :user
  # before_create :post_to_twitter

  # validates :user_id, :body, presence: true

  # def post_to_twitter
  #   user.twitter.update(body)
  # end
end
