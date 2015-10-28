class AddColumnToPet < ActiveRecord::Migration
  def change
    add_column :pets, :api_key, :string
    add_column :pets, :master_user, :integer
  end
end
