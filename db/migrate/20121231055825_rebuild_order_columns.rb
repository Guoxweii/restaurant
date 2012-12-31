class RebuildOrderColumns < ActiveRecord::Migration
  def up
    remove_column :orders, :check_id
    add_column :orders, :ip_address, :string
    add_column :orders, :address, :string
    add_column :orders, :name, :string
    add_column :orders, :email, :string
    add_column :orders, :telephone, :string
    
    drop_table :checks
  end

  def down
  end
end
