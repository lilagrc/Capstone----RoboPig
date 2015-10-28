class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :pet_id
      t.integer :current_supply
      t.integer :feeding_amount

      t.timestamps null: false
    end
  end
end
