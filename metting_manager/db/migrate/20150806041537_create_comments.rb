class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :time_sign
      t.integer :user_id
      t.integer :time_order_id
      t.text :desc
      t.timestamps null: false
    end
  end
end
