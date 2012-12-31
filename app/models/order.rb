class Order < ActiveRecord::Base
  attr_accessible :num, :varieties, :ip_address, :name, :address, :telephone, :email, :ok_time
  has_and_belongs_to_many :varieties
  validates_presence_of :num, :address, :telephone
end
