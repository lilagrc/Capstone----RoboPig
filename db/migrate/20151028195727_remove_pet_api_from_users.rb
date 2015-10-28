class RemovePetApiFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :pet_api, :string
  end
end
