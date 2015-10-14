class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer  "user_id"
      t.text     "body"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
