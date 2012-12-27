class Cdr < ActiveRecord::Base
  attr_accessible :ip_address, :local_url, :area
  include HTTParty
  format :xml
end