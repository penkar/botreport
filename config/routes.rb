Rails.application.routes.draw do
  get 'home/login'

  get '/home', to: 'home#login' 
  get '/home/options' => 'home#options', :as => 'options'
  get '/home/options/:price/:strike/:vol/:time/:rf' => 'home#options_price', :as => 'options_price'

  devise_for :users
  root :to => 'home#login'
  resources :users do 
    resources :projects, except: [:edit] do
      collection { post :import }
      resources :incomestmts, except: [:edit, :update, :destroy, :index, :create, :new] 
      resources :cashflows, except: [:edit, :update, :destroy, :index, :create, :new] 
      resources :balancesheets, except: [:edit, :update, :destroy, :index, :create, :new] 
      resources :incomestmts, except: [:edit, :update, :destroy, :index, :create, :new] 
      resources :ratios, except: [:edit, :update, :destroy, :index, :create, :new] 
    end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
