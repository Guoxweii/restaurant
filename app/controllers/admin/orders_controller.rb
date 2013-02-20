# encoding: utf-8
class Admin::OrdersController < Admin::BaseController
  def index
    params[:search] ||= {}
    params[:search][:meta_sort] = "created_at.desc" unless params[:search][:meta_sort]
    @search = Order.online.search(params[:search])
    @orders = @search.page(params[:page])
  end
  
  def show
    @order = Order.find(params[:id])
    render :layout => nil
  end
  
  def complete
    params[:search] ||= {}
    params[:search][:meta_sort] = "created_at.desc" unless params[:search][:meta_sort]
    @search = Order.completed.search(params[:search])
    @orders = @search.page(params[:page])
  end
  
  def onlined
    order = Order.find(params[:id])
    order.state = :online
    order.save!
    flash[:notice] = "状态修改完毕"
    redirect_to complete_admin_orders_path
  end
  
  def completed
    order = Order.find(params[:id])
    order.state = :completed
    order.save!
    flash[:notice] = "状态修改完毕"
    redirect_to admin_orders_path
  end
  
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "delete successfully!"
    redirect_to admin_orders_path
  end
  
end