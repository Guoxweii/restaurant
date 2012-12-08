class CategoriesController < BaseController
  def index
    redirect_to category_path(Category.find_by_code("home"))
  end
  
  def show
    @categories = Category.all
    case 
    when !params[:id] || Category.find(params[:id]).code == "home"
      @category = Category.find_by_code("home")
      @photos = Photo.all
      render :action => "home"
    when Category.find(params[:id]).code == "contact"
      @category = Category.find_by_code("contact")
      @item = @category.items.first
      render :action => "contact"
    else
      @category = Category.find(params[:id])
      @item = @category.items.first
    end
  end
end