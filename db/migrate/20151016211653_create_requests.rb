class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :body, default: "do nothing"

      t.timestamps null: false
    end
  end
end
