class Admin::CdrsController < Admin::BaseController
  def index
    params[:search] ||= {}
    params[:search][:meta_sort] = "created_at.desc" unless params[:search][:meta_sort]
    @search = Cdr.search(params[:search])
    @cdrs = @search.page(params[:page])
  end
end