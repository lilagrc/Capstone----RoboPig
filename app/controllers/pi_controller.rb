class PiController < ApplicationController

# create method to update data sent to turn on LEDs
def run_pi
  run = {run: false}

  render json: run
end

# render json: {}, status: 400
end
