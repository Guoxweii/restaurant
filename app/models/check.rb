class Check < ActiveRecord::Base
  attr_accessible :num, :code
  belongs_to :order
  has_and_belongs_to_many :varieties
  validates_presence_of :num, :code
end