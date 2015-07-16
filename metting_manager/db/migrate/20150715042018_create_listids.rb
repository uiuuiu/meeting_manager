class CreateListids < ActiveRecord::Migration
  def change
    create_table :listids do |t|
    	t.integer :ids
    end
  end
end
