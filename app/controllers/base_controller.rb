class BaseController < ApplicationController
  layout "application"
  before_filter :set_language
  
  def set_language
    session[:local] ||= "en" 
    session[:local] = params[:local] || session[:local]
  end
end