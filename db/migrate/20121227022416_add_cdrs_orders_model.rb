class AddCdrsOrdersModel < ActiveRecord::Migration
  def up
    create_table :cdrs do |t|
      t.string  :ip_address
      t.string  :local_url
      t.timestamps
    end
    
    create_table :orders do |t|
      t.string  :ip_address
      t.string  :address
      t.string  :name
      t.string  :email
      t.string  :telephone
      t.timestamps
    end
    
    create_table :orders_varieties do |t|
      t.integer  :order_id
      t.integer  :variety_id
      t.timestamps
    end
    
    create_table :varieties do |t|
      t.string  :name
      t.string  :code
      t.string  :ancestry
      t.timestamps
    end
    
     add_index :varieties, [:ancestry]
    
  end

  def down
  end
end
