Shop::Application.routes.draw do
  
  resources :users
  resources :news_items
  resources :partners
  resources :orders
  resources :line_items
  resources :carts
  resources :product_images
  resources :pages
  resources :options
  resources :password_resets
  resources :brands

  resources :categories do
    get 'page/:page', :action => :show, :on => :collection
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action
  match '/products/product_pop_image', :controller => 'products', :action => 'product_pop_image'

  match 'kategorien' => 'categories#index'

  match 'kategorie/:id' => 'categories#show'

  match '/impressum', :to => 'pages#impressum'
  match '/agb', :to => 'pages#agb'
  match 'login', :controller => 'sessions', :action => 'login'
  match 'logout' => 'sessions#destroy'
  match 'register' => 'users#new'

  resources :products
  resources :sessions


  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#home'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
