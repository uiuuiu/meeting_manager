class AddCellidToTimeOrders < ActiveRecord::Migration
  def change
    add_column :time_orders, :cellid, :integer
  end
end
