class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name,              null: false, default: 0
      t.integer :user_id,          null: false, default: 0
      t.text :desc
      t.timestamps null: false
      
    end
  end
end