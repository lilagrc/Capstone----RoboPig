class AddPetApiToUser < ActiveRecord::Migration
  def change
    add_column :users, :pet_api, :string
  end
end
