class Category < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  attr_accessible :en_name, :se_name, :code, :row_order
  has_many :items
end
