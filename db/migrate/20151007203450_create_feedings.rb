class CreateFeedings < ActiveRecord::Migration
  def change
    create_table :feedings do |t|
      t.datetime :date
      t.integer :pet_id

      t.timestamps null: false
    end
  end
end
