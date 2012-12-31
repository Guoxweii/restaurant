#encoding: utf-8
class UserMailer < ActionMailer::Base
  default from: "beni@gmail.com"
  
  def order_email(email, order)
    @order = order
    mail(:to => email, :subject => "welcome to visit Beni's restaurant!")
  end
end
