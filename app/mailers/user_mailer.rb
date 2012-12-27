#encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "beni@gmail.com"
  
  def welcome_email(email)
    # @user = user
    @url  = "http://example.com/login"
    mail(:to => email, :subject => "欢迎来到我的网站")
  end
end
