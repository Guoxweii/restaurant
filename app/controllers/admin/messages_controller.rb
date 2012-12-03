#encoding: utf-8
class Admin::MessagesController < Admin::BaseController
  def index
    @categories = Category.all
  end
  
  def show
    @category = Category.find(params[:id])
    @item = @category.items.first
  end
  
  def new
    @category = Category.find(params[:category_id])
    @item = Item.new
  end
  
  def create
    @category = Category.find(params[:category_id])
    @item = @category.items.new(params[:item])
    if @item.save
      flash[:notice] = "创建成功!"
      redirect_to admin_message_path(@category)
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:category_id])
    @item = @category.items.find(params[:id])
    if @item.update_attributes(params[:item])
      flash[:notice] = "修改成功!"
      redirect_to admin_message_path(@category)
    else
      render :new
    end
  end
  
  def carousel
    @category = Category.find(params[:id])
    @photos = Photo.all
  end
end