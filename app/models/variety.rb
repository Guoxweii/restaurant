class Variety < ActiveRecord::Base
  # attr_accessible :en_content, :se_content, :category_id
  has_and_belongs_to_many :orders
end
