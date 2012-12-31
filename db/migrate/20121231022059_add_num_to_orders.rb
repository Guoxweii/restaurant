class AddNumToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :num, :integer
    add_column :orders, :check_id, :integer
    remove_column :orders, :ip_address
    remove_column :orders, :address
    remove_column :orders, :name
    remove_column :orders, :email
    remove_column :orders, :telephone
    
    create_table :checks do |t|
      t.string  :ip_address
      t.string  :address
      t.string  :name
      t.string  :email
      t.string  :telephone
      t.datetime :ok_time
      t.timestamps
    end
  end
end