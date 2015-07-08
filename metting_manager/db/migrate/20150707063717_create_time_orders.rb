class CreateTime_orders < ActiveRecord::Migration
  def change
    create_table :time_orders do |t|
      t.datetime :time_signed
      t.datetime :time_start
      t.datetime :time_end
      t.timestamps null: false
    end
  end
end