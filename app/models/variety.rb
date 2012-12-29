class Variety < ActiveRecord::Base
  has_and_belongs_to_many :orders
  has_ancestry
  include RankedModel
  ranks :row_order
  attr_accessible :en_name, :se_name, :code, :row_order
end
