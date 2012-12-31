class Order < ActiveRecord::Base
  attr_accessible :ip_address, :name, :address, :telephone, :email, :ok_time
  has_many :varieties
end
