class AddIndexToTables < ActiveRecord::Migration
  def change
    add_index "categories", ["row_order"], :name => "index_categories_on_row_order"
    add_index "checks", ["code"], :name => "index_checks_varieties_on_code"
    add_index "checks", ["order_id"], :name => "index_checks_on_order_id"
    add_index "checks_varieties", ["check_id"], :name => "index_checks_varieties_on_check_id"
    add_index "checks_varieties", ["variety_id"], :name => "index_checks_varieties_on_variety_id"
  end
end
