#encoding: utf-8
class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.rank(:row_order).page(params[:page]).per(20)
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    
    if @category.save
      flash[:notice] = "模块创建成功"
      redirect_to admin_categories_path
    else
      render :new
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "模块修改成功"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:notice] = "模块删除成功"
    redirect_to admin_categories_path
  end
  
  def sort
    categories = Category.rank(:row_order).all
    category = Category.find(params[:id])
    
    index = categories.index(category)
    index = (params[:sort] == 'up') ? ((index - 1) < 0 ? 0 : index - 1) : ((index + 1 > categories.size - 1) ? categories.size - 1 : index + 1)
    category.update_attribute :row_order_position, index
    @categories = Category.rank(:row_order).page(params[:page]).per(20)
  end
end