#encoding: utf-8
class Admin::TagsController < Admin::BaseController
  before_filter :find_parent
  
  def index
    @search = @parent.children.rank(:row_order).search(params[:search])
    @tags = @search.page(params[:page])
  end
  
  def new
    @tag = @parent.children.new
  end

  def create
    @tag = @parent.children.new(params[:variety])
    
    if @tag.save
      flash[:notice] = "菜单创建成功"
      redirect_to admin_variety_tags_path(@parent)
    else
      render :new
    end
  end
  
  def edit
    @tag = @parent.children.find(params[:id])
  end

  def update
    @tag = @parent.children.find(params[:id])
    if @tag.update_attributes(params[:variety])
      flash[:notice] = "菜单修改成功"
      redirect_to admin_variety_tags_path(@parent)
    else
      render :edit
    end
  end
  
  def destroy
    @tag = Variety.find(params[:id])
    @tag.destroy
    flash[:notice] = "菜单删除成功"
    redirect_to admin_variety_tags_path(@parent)
  end

  def find_parent
    @parent = Variety.find(params[:variety_id]) if params[:variety_id]
  end
  
  def sort
    tags = Variety.rank(:row_order)
    tag = @parent.children.find(params[:id])
    
    index = @parent.children.rank(:row_order).index(tag)
    index = (params[:sort] == 'up') ? (index - 1 < 0 ? 0 : index - 1) : (index + 1 > (@parent.children.size - 1) ? @parent.children.size - 1 : index + 1)
    index = tags.index(@parent.children.rank(:row_order)[index])

    tag.update_attribute :row_order_position, index

    @search = @parent.children.rank(:row_order).search(params[:search])
    @tags = @search.page(params[:page])
  end
end
