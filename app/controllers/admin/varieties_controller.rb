#encoding: utf-8
class Admin::VarietiesController < Admin::BaseController
  def index
    @varieties = Variety.roots.rank(:row_order).page(params[:page]).per(20)
  end
  
  def new
    @variety = Variety.new
  end

  def create
    @variety = Variety.new(params[:variety])
    
    if @variety.save
      flash[:notice] = "模块创建成功"
      redirect_to admin_varieties_path
    else
      render :new
    end
  end
  
  def edit
    @variety = Variety.find(params[:id])
  end

  def update
    @variety = Variety.find(params[:id])
    if @variety.update_attributes(params[:variety])
      flash[:notice] = "模块修改成功"
      redirect_to admin_varieties_path
    else
      render :edit
    end
  end
  
  def destroy
    @variety = Variety.find(params[:id])
    @variety.destroy
    flash[:notice] = "模块删除成功"
    redirect_to admin_varieties_path
  end
  
  def sort
    varieties = Variety.rank(:row_order).all
    variety = Variety.find(params[:id])
    
    index = varieties.index(variety)
    index = (params[:sort] == 'up') ? ((index - 1) < 0 ? 0 : index - 1) : ((index + 1 > varieties.size - 1) ? varieties.size - 1 : index + 1)
    variety.update_attribute :row_order_position, index
    
    @varieties = Variety.roots.rank(:row_order).page(params[:page]).per(20)
  end
end