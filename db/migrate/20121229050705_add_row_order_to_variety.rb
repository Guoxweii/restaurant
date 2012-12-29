class AddRowOrderToVariety < ActiveRecord::Migration
  def change
    add_column :varieties, :row_order, :integer
  end
end
