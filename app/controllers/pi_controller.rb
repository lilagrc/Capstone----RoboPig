class PiController < ApplicationController
# skip_before_action :verify_authenticity_token
# create method to update db to feed request
  def feed_request
    request = Request.first_or_initialize(id: 1, body: "placeholder")
    request.body = "feed"
    request.save

    redirect_to root_path
  end

  def reset_request
    request = Request.find(1)
    request.body = "none"
    request.save

    redirect_to root_path
  end

  # method to update db with info on timer changes
  def set_timer


  end



end
