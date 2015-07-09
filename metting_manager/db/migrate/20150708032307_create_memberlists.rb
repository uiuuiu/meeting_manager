class CreateMemberlists < ActiveRecord::Migration
  def change
    create_table :memberlists do |t|
      t.integer :user_id
      t.integer :group_id
      t.timestamps null: false
    end
  end
end
