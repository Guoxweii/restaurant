class Order < ActiveRecord::Base
  attr_accessible :ip_address, :name, :address, :telephone, :email, :ok_time, :description
  has_many :checks
  validates_presence_of :address, :telephone
end
