class Item < ActiveRecord::Base
  attr_accessible :en_content, :se_content, :category_id
  belongs_to :category
end
