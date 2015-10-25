class PiController < ApplicationController
  before_action :require_login

  def feed_request
    user = User.find(session[:user_id])
    pet = Pet.find(user.pet_id)
    request = Request.where(pet_id: pet.id).first_or_initialize
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
    user = User.find(session[:user_id])
    pet = Pet.find(user.pet_id)
    @request = Request.where(pet_id: pet.id).first_or_initialize
    @request.schedule = nil
    @request.body = nil
    @request.save
  end

  def set_timer
    user = User.find(session[:user_id])
    pet = Pet.find(user.pet_id)
    request = Request.find_by(pet_id: pet.id)
    request.schedule = params["request"]["schedule"]
    request.save
    flash[:notice] = "Your feeding has been scheduled. You can schedule another feeding time by clicking 'Schedule a Feeding'"

    redirect_to root_path
  end

  def cancel_feeding
    user = User.find(session[:user_id])
    pet = Pet.find(user.pet_id)
    request = Request.find_by(pet_id: pet.id)
    request.body = nil
    request.schedule = "cancel"
    request.save
    flash[:notice] = "Your feedings have been cancelled"
    redirect_to root_path
  end

end
