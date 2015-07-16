class FixListid < ActiveRecord::Migration
  def change
  	rename_column :listids, :ids, :idcell
  end
end
