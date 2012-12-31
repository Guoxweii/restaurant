class Category < ActiveRecord::Base
  include RankedModel
  ranks :row_order
  attr_accessible :en_name, :se_name, :code, :row_order
  has_many :items
  validates_presence_of :en_name, :se_name
end
