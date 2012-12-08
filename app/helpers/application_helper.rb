module ApplicationHelper
  
  def show_value_with_language(obj, key)
    return obj.send(session[:local] + "_" + key)
  end
end
