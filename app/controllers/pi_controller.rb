class PiController < ApplicationController
  before_action :require_login
  before_action :find_pet


  def feed_request
    request = Request.where(pet_id: @pet.id).first_or_initialize
    request.schedule = nil
    request.body = "feed"
    request.save

    redirect_to root_path
  end

  def new_schedule
    @request = Request.where(pet_id: @pet.id).first_or_initialize
    @request.schedule = nil
    @request.body = nil
    @request.save

    respond_to do |format|
      format.html { render :layout => false, :partial => 'home/schedule'}
    end
  end

  def set_timer
    request = Request.find_by(pet_id: @pet.id)
    request.schedule = params["request"]["schedule"]
    request.save
    flash[:notice] = "Your feeding has been scheduled. You can schedule another feeding time by clicking 'Schedule a Feeding'"

    add_new_schedule

    redirect_to root_path
  end

  def cancel_feeding
    request = Request.find_by(pet_id: @pet.id)
    request.body = nil
    request.schedule = "cancel"
    request.save
    flash[:notice] = "Your feedings have been cancelled"

    remove_scheduled_feedings

    redirect_to root_path
  end

  private

  def add_new_schedule
    s = Schedule.create(time: params["request"]["schedule"])
    s.save
  end

  def remove_scheduled_feedings
    Schedule.delete_all
  end

end
