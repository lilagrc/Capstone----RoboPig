class PetsController < ApplicationController
  before_action :require_login

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.create(create_params[:pet])
    @pet.user_id = session[:user_id]

    if @pet.save
        flash[:notice] = "Congratulations! You have now registered with Robo Pets. Please see your profile page for an API token which can be used for your robo device."
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end


  def create_params
    params.permit(pet: [:name, :breed])
  end
end
