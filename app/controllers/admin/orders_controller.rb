class Admin::OrdersController < Admin::BaseController
  def index
    params[:search] ||= {}
    params[:search][:meta_sort] = "created_at.desc" unless params[:search][:meta_sort]
    @search = Order.search(params[:search])
    @orders = @search.page(params[:page])
  end
  
  def show
    @order = Order.find(params[:id])
    render :layout => nil
  end
end