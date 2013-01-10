class CategoriesController < BaseController
  before_filter :get_left_menu_data
  
  def index
    redirect_to category_path(Category.find_by_code("home"))
  end
  
  def show
    case 
    when !params[:id] || Category.find(params[:id]).code == "home"
      @category = Category.find_by_code("home")
      @photos = Photo.all
      render :action => "home"
    when !params[:id] || Category.find(params[:id]).code == "map"
      @category = Category.find_by_code("map")
      render :action => "map"
    when Category.find(params[:id]).code == "contact"
      @category = Category.find_by_code("contact")
      @item = @category.items.first
      render :action => "contact"
    when Category.find(params[:id]).code == "menu"
      redirect_to menu_category_path(params[:id])
    else
      @category = Category.find(params[:id])
      @item = @category.items.first
    end
  end
  
  def menu
    @code = UUIDTools::UUID.random_create.to_s
    @category = Category.find(params[:id])
    @item = @category.items.first
    @varieties = Variety.roots.rank(:row_order)
    @tags = @varieties.map(&:children)
    @order = Order.new
    @checks = [Check.new]
  end
  
  def check
    @category = Category.find(params[:id])
    @code = params[:code]
    @order = Order.new(params[:order])
    @order.save
  end
  
  def ok
    relation_order_with_checks
    UserMailer.order_email("410006720@qq.com", @order).deliver
  end
  
  def add
    @code = params[:check][:code]
    @category = Category.find(params[:id])
    @check = Check.new(params[:check])
    relation_check_with_varieties
  end
  
  def add_check
    @category = Category.find(params[:id])
    @code = params[:code]
    @check = Check.new(:code => @code)
    @varieties = Variety.roots
    @tags = @varieties.map(&:children)
  end
  
  def edit_check
    @category = Category.find(params[:id])
    @code = params[:code]
    @check = Check.find(params[:check_id])
    @varieties = Variety.roots
    @tags = @varieties.map(&:children)
  end
  
  def cancel_check
    @category = Category.find(params[:id])
    @code = params[:code]
    @check = Check.find(params[:check_id])
    @check.destroy
  end
  
  def list
    @category = Category.find(params[:id])
    @code = params[:code]
    @checks = Check.where(:code => @code)
    @order = Order.find(params[:order_id])
    render :layout => nil
  end
  
  private
  def get_left_menu_data
    @categories = Category.rank(:row_order)
  end
  
  def relation_check_with_varieties
    varieties_id = params[:variety].values
    varieties_id.each {|id| @check.varieties << Variety.find(id) }
    @check.save!
  end
  
  def relation_order_with_checks
    @checks = Check.where(:code => params[:code])
    @order = Order.find(params[:order_id])
    @order.checks << @checks
    @order.state = "online"
    @order.save!
  end
  
end