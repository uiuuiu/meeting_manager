class CreateRole < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :desc
    end
  end
end
