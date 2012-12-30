class RemoveTimeColumn < ActiveRecord::Migration
  def up
    remove_column :orders_varieties, :created_at
    remove_column :orders_varieties, :updated_at
  end

  def down
  end
end