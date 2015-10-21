class PiController < ApplicationController
# skip_before_action :verify_authenticity_token
# create method to update db to feed request
  def feed_request
    request = Request.first_or_initialize(id: 1, body: "placeholder")
    request.schedule = nil
    request.body = "feed"
    request.save

    redirect_to root_path
  end

  # def reset_request
  #   request = Request.find(1)
  #   request.body = "none"
  #   request.save

  #   redirect_to root_path
  # end

  # method to update db with info on timer changes

  def new_schedule
    @request = Request.first_or_initialize(id: 1, body: "placeholder")
    @request.body = nil
  end

  def set_timer
    request = Request.find(1)
    request.schedule = params["request"]["schedule"]
    request.save

    redirect_to root_path
  end



end
