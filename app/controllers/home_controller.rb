class HomeController < ApplicationController


  def index
    if session[:user_id]
      @user = User.find(session[:user_id])
      if @user.pet_id != nil
        @pet = Pet.find(@user.pet_id)
        find_num_feedings
      end
    end
  end

  def check_db
    feedings = find_num_feedings

    render json: {num: feedings}
  end

  private

  def find_num_feedings
  user = User.find(session[:user_id])
  pet = Pet.find(user.pet_id)
  feedings = Feeding.where("created_at >= ? AND pet_id = ?", Time.zone.now.beginning_of_day, pet.id)

    @num_feedings = feedings.size

    return @num_feedings
  end
end
