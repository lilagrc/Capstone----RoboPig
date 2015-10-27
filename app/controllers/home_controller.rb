class HomeController < ApplicationController

  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.pet_id != nil
        @pet = Pet.find(@user.pet_id)
      end
    end

    find_num_feedings
  end

  def check_db
    user = User.find(session[:user_id])
    pet = Pet.find(user.pet_id)
    request = Request.find_by(pet_id: pet.id)

    if request.body == nil && request.schedule == nil
      render status: 200
    else
      render status: 500
    end
  end

  private

  def find_num_feedings
    feedings = Feeding.where("created_at >= ?", Time.zone.now.beginning_of_day)

    @num_feedings = feedings.size

    return @num_feedings
  end
end
