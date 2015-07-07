class CreateTimes < ActiveRecord::Migration
  def change
    create_table :times do |t|
      t.datetime :time_signed
      t.datetime :time_start
      t.datetime :time_end
    end
  end
end