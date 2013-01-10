class AddState < ActiveRecord::Migration
  def up
    add_column :orders, :state, :string, :default => :offline
  end

  def down
  end
end
