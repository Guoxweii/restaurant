class AddSeNameToVariety < ActiveRecord::Migration
  def change
    rename_column :varieties, :name, :en_name
    add_column :varieties, :se_name, :string
  end
end
