class AddColumnToPet < ActiveRecord::Migration
  def change
    add_column :pets, :api_key, :string
  end
end
