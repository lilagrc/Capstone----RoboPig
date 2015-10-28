class AddMasterUserToPet < ActiveRecord::Migration
  def change
    add_column :pets, :master_user, :integer
  end
end
