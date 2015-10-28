class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :time

      t.timestamps null: false
    end
  end
end
