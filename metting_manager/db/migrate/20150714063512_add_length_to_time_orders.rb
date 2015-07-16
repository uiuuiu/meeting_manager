class AddLengthToTimeOrders < ActiveRecord::Migration
  def change
    add_column :time_orders, :length, :integer
  end
end
