class InventoriesController < ApplicationController
  before_action :find_pet

  def new
    @inventory = Inventory.new
  end

  def create
    Inventory.create(
      current_supply: params[:inventory][:current_supply],
      feeding_amount: params[:inventory][:feeding_amount],
      pet_id: @pet.id
      )

    redirect_to user_path(session[:user_id])
  end

  def edit
    @inventory = Inventory.find_by(pet_id: @pet.id)
  end

  def update
    @inventory = Inventory.find_by(pet_id: @pet.id)
    @inventory.update(
      current_supply: params[:inventory][:current_supply],
      feeding_amount: params[:inventory][:feeding_amount],
      )

    redirect_to user_path(session[:user_id])
  end

  private

  def create_params
    params.permit(inventory: [:current_supply, :feeding_amount])
  end
end
