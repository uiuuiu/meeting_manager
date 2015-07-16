class AddUseridToTimeOrders < ActiveRecord::Migration
  def change
    add_column :time_orders, :user_id, :integer
  end
end
