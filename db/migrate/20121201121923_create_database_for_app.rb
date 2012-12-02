class CreateDatabaseForApp < ActiveRecord::Migration
  def up
    create_table(:categories) do |t|
      t.string :se_name
      t.string :en_name
      t.string :code
      t.timestamps
    end
    
    create_table(:photos) do |t|
      t.string :poster, :null => false
      t.timestamps
    end
    
    create_table(:items) do |t|
      t.integer :category_id
      t.string :en_content
      t.string :se_content
      t.timestamps
    end
    
  end

  def down
  end
end
