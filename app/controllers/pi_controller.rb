class PiController < ApplicationController

# create method to update db to feed request
def feed_request
  request = Request.first
  request.body = "feed"
end

  session["request"] = params["request"]["body"]

  redirect_to root_path
end

def run_pi
  ## try a database record that gets flipped
  res = { feed: true }
  render json: res
end

# render json: {}, status: 400
end
