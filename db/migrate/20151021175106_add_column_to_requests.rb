class AddColumnToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :schedule, :string
  end
end
