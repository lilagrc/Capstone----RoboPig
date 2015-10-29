class PetsController < ApplicationController
  before_action :require_login

  def new
    @pet = Pet.new
  end

  def create
    user = User.find(session[:user_id])
    pet = Pet.create(create_params[:pet])
    pet.api_key = Pet.generate_api_key
    pet.master_user = user.id
    user.pet_id = pet.id
    user.save

    if pet.save
        flash[:notice] = "Congratulations! You have now registered with Robo Pets. Please see your profile page for an API token which can be used for your robo device."
        redirect_to root_path
    else
      render 'new'
    end
  end

  def regenerate_token
    @pet.api_key = Pet.generate_api_key
    @pet.save

    remove_pet_links(@pet)

    redirect_to user_path(session[:user_id])
  end

  private

  def create_params
    params.permit(pet: [:name, :breed])
  end

  def remove_pet_links(pet)
    users = pet.users

    users.each do |user|
      unless pet.master_user == user.id
        user.pet_id = nil
        user.save
      end
    end
  end
end
