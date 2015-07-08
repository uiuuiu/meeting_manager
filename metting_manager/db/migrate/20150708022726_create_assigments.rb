class CreateAssigments < ActiveRecord::Migration
  def change
    create_table :assigments do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps null: false
    end
  end
end
