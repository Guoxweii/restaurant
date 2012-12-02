Restaurant::Application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users
  
  namespace :admin do
    root :to => redirect {|p, r| "#{r.script_name}/admin/categories" }
    resources :categories do
      scope "/:sort" do
        put 'sort', :on => :member
      end
      resources :items
    end
    
    resources :messages
    
    resources :photos
  end
end
