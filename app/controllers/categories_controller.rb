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
    @category = Category.find(params[:id])
    @item = @category.items.first
    @varieties = Variety.roots.rank(:row_order)
    @tags = @varieties.map(&:children)
    @order = Order.new
  end
  
  def check
    @category = Category.find(params[:id])
    @item = @category.items.first
    @order = Order.new(params[:order])
    @order.ip_address = request.ip
    if @order.save
      relation_order_with_varieties
      UserMailer.order_email("410006720@qq.com", @order).deliver
    else
      @varieties = Variety.roots
      @tags = @varieties.map(&:children)
      @variety = params[:variety]
      render :action => "menu"
    end
  end
  
  private
  def get_left_menu_data
    @categories = Category.rank(:row_order)
  end
  
  def relation_order_with_varieties
    varieties_id = params[:variety].values
    varieties_id.each {|id| @order.varieties << Variety.find(id) }
    @order.save!
  end
  
end