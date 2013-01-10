class AddChecks < ActiveRecord::Migration
  def up
    add_column :orders, :description, :text
    remove_column :orders, :num
    
    create_table :checks do |t|
      t.integer :order_id
      t.integer :num, :default => 1
      t.timestamps
    end
    
    drop_table :orders_varieties
    create_table :checks_varieties do |t|
      t.integer  :check_id
      t.integer  :variety_id
      t.timestamps
    end
    
  end

  def down
  end
end
