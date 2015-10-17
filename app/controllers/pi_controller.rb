class PiController < ApplicationController

# create method to update db to feed request
  def feed_request
    request = Request.first_or_initialize(id: 1, body: "placeholder")
    request.body = "feed"
    request.save
    raise
    redirect_to root_path
  end

  # method to update db with info on timer changes
  def set_timer


  end

  # method to send pi information from request db
  def run_pi

    render json: res
  end

  def confirmation

    #remove body data from db if response is success
  end

end
