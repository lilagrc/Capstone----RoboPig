class AddColumnToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :pet_id, :integer
  end
end
