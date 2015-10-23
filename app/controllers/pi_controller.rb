class PiController < ApplicationController
  before_action :require_login

  def feed_request
    request = Request.first_or_initialize(id: 1, body: nil, schedule: nil, user_id: session[:user_id])
    request.schedule = nil
    request.body = "feed"
    request.save

    add_feeding

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
    @request = Request.first_or_initialize(id: 1, body: "placeholder", user_id: session[:user_id])
    @request.schedule = nil
  end

  def set_timer
    request = Request.find(1)
    request.schedule = params["request"]["schedule"]
    request.save
    flash[:notice] = "Your feeding has been scheduled. You can schedule another feeding time by clicking 'Schedule a Feeding'"

    redirect_to root_path
  end

  def cancel_feeding
    request = Request.find(1)
    request.body = nil
    request.schedule = "cancel"
    request.save
    flash[:notice] = "Your feedings have been cancelled"

    redirect_to root_path
  end

  private

  def add_feeding
    id = session[:user_id]
    user = User.find_by(id: id)
    #only handles one pet per user for now
    pet_id = user.pets.first.id
    new_feeding = Feeding.new
    new_feeding.pet_id = pet_id
    # new_feeding.date = Time.now.strftime(%I:%M,%m/%d/%y)
    new_feeding.amount = 1
    new_feeding.save
  end

end
