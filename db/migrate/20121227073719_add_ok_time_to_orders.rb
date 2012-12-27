class AddOkTimeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :ok_time, :datetime
  end
end
