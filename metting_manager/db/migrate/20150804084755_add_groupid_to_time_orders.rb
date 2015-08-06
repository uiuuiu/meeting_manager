class AddGroupidToTimeOrders < ActiveRecord::Migration
  def change
    add_column :time_orders, :group_id, :integer
  end
end
