class Order < ActiveRecord::Base
  attr_accessible :ip_address, :name, :address, :telephone, :email, :ok_time, :description, :state
  has_many :checks
  validates_presence_of :address, :telephone
  symbolize :state, :in => [:online, :offline], :scopes => true
  
  def self.delete_unuseful_data
    Order.offline.where("created_at < ?", Date.yesterday).destroy_all
    Check.where("order_id is NULL AND created_at < ?", Date.yesterday).destroy_all
  end
end
