class PiController < ApplicationController

# create method to update data sent to turn on LEDs
def new_request
#   if params["request"]["body"] == "true"
#     session["request"] = true
#   else
#     session["request"] = false
#   end

  session["request"] = params["request"]["body"]
  redirect_to root_path
end

def run_pi
  request = session["request"]
  if request = "true"
    run = {feed: true}
  else
    run = {feed: false}

  render json: run
end

# render json: {}, status: 400
end
