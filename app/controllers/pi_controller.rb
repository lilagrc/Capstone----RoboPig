class PiController < ApplicationController

# create method to update data sent to turn on LEDs
def new_request
  session["request"] = params["request"]["body"]
  redirect_to root_path
end

def run_pi
  request = session["request"]
  run = {run: request}

  render json: run
end

# render json: {}, status: 400
end
