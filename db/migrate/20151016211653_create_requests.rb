class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :body

      t.timestamps null: false
    end
  end
end
