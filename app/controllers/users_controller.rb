class UsersController < ApplicationController
  before_action :require_login

  def show
    @user = User.find(session[:user_id])
    @pet = Pet.find(@user.pet_id)
    scheduled_feedings = Schedule.all
    @scheduled_feedings = scheduled_feedings.order(:time)
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    user = User.find(session[:user_id])
    token = params[:user][:pet_id]
    token.strip!

    pet = Pet.find_by(api_key: token)

    if pet != nil
      user.pet_id = pet.id
      user.save
      redirect_to user_path
    else
      flash[:notice] = "This pet could not be found"
      redirect_to root_path
    end
  end

  private

  def create_params
    params.permit(user: [:pet_id])
  end
end

