class PetsController < ApplicationController
  before_action :require_login

  def new
    @pet = Pet.new
  end

  def create
    user = User.find(session[:user_id])
    pet = Pet.create(create_params[:pet])
    pet.api_key = Pet.generate_api_key
    user.pet_id = pet.id
    user.save

    if pet.save
        flash[:notice] = "Congratulations! You have now registered with Robo Pets. Please see your profile page for an API token which can be used for your robo device."
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  private

  def create_params
    params.permit(pet: [:name, :breed])
  end



end
