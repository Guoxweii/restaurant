#encoding: utf-8
class Admin::PhotosController < Admin::BaseController
  def index
    @photos = Photo.page(params[:page]).per(20)
  end
  
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:photo])
    
    if @photo.save
      flash[:notice] = "模块创建成功"
      redirect_to admin_photos_path
    else
      render :new
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "模块修改成功"
      redirect_to admin_photos_path
    else
      render :edit
    end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = "模块删除成功"
    redirect_to admin_photos_path
  end
end