class AddDescToTimeOrders < ActiveRecord::Migration
  def change
  	add_column :time_orders, :desc, :text
  end
end
