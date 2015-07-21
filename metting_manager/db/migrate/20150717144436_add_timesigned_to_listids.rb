class AddTimesignedToListids < ActiveRecord::Migration
  def change
  	add_column :listids, :time_signed, :datetime
  end
end
