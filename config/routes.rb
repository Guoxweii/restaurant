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
    
    resources :messages do
      get 'carousel', :on => :member
    end
    
    resources :photos
    resources :cdrs
    resources :orders
    resources :varieties do
      scope "/:sort" do
        put 'sort', :on => :member
      end
      resources :tags do
        scope "/:sort" do
          put 'sort', :on => :member
        end
      end
    end
  end
  
  resources :categories do
    get  'menu',  :on => :member
    post 'check', :on => :member
    get 'ok',    :on => :member
    post 'add', :on => :member
    get 'add_check', :on => :member
    get 'edit_check', :on => :member
    get 'cancel_check', :on => :member
    get 'list', :on => :member
  end
  
  
  root :to => redirect {|p, r| "#{r.script_name}/categories" }
  
end
