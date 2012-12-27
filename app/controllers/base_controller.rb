class BaseController < ApplicationController
  layout "application"
  before_filter :set_language, :add_to_cdr
  
  def set_language
    session[:local] ||= "en" 
    session[:local] = params[:local] || session[:local]
  end
  
  def add_to_cdr
    Cdr.create! do |cdr|
      cdr.ip_address = request.ip
      cdr.local_url = request.fullpath
    end
  end
end