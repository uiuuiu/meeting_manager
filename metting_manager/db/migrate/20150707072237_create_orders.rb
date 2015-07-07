class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :group_id
      t.text :content
      t.integer :time_id
      t.integer :room_id
      t.timestamps null: false
    end
  end
end
