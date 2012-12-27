class AddAreaToCdrs < ActiveRecord::Migration
  def change
    add_column :cdrs, :area, :string
  end
end
