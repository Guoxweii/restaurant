class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    admin_root_path
  end
  
  def layout_by_resource
    if devise_controller?
      "admin"
    else
      "application"
    end
  end
end
