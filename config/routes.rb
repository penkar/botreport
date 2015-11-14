Rails.application.routes.draw do
  get 'home/login'

  get '/home', to: 'home#login'
  get '/home/options' => 'home#options', :as => 'options'
  post '/home/options' => 'home#options_price', :as => 'options_price'
  get '/home/american_options' => 'home#american_options', :as => 'american_options'
  post '/home/american_options' => 'home#american_options_price', :as => 'american_options_price'
  get '/home/ggm' => 'home#ggm', :as => 'ggm'
  post '/home/ggm' => 'home#ggm_calc', :as => 'ggm_calc'


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
end
