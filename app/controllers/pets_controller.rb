class PetsController < ApplicationController
  def new
    @pet = Pet.new
  end


  def create
    @pet = Pet.create(create_params[:pet])
    @pet.user_id = session[:user_id]

    if @pet.save
        redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end


  def create_params
    params.permit(pet: [:name, :breed])
  end
end
