class UsersController < ApplicationController
  before_action :require_login
  before_action :find_pet, only: :remove_pet

  def show
    @user = User.find(session[:user_id])
    if @user.pet_id != nil
      @pet = Pet.find(@user.pet_id)
      scheduled_feedings = Schedule.all
      @scheduled_feedings = scheduled_feedings.order(:time)
      @inventory = Inventory.find_by(pet_id: @pet.id)
    end
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
      redirect_to root_path
    else
      flash[:notice] = "This pet could not be found"
      redirect_to root_path
    end
  end

  def remove_pet
    @user.pet_id = nil
    @user.save
    flash[:notice] = "You have successfully unlinked from the feeder."
    redirect_to root_path
  end

  private

  def create_params
    params.permit(user: [:pet_id])
  end
end

