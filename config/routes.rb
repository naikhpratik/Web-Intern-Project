Rails.application.routes.draw do
root 'dashboard#dashboard'
#page
  get 'page/home'
  get 'page/about'
  get 'page/contact'

#products

  get 'products/assign_product'

#dashboard
  get 'dashboard/dashboard'

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  #devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout"}

  #get 'admin/index'
  #get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
  #get 'users/userpage'

  resources :products
  resources :users
  resources :admin
  #get 'api/index'
  get '/product'=>'users#product'
 #get '/users' => 'users#index'
 get '/userpage' => 'users#userpage'
  #get 'sessions' => 'sessions#new'
  #get 'users' => 'users#new'
  #get 'search' => 'search#index'
  #get 'logout' => 'sessions#destroy'
  #get 'users' => 'users#userpage'
  get 'admin' => 'admin#index'
  controller :sessions do
  #  get  'login' => :new
    #post 'login' => :create
    #post 'Make admin' => :makeadmin
  end

  

  controller :users do
    get 'Make admin' => :makeadmin
  end


match ':controller(/:action(/:id))', :via => :get
  #get "sessions/create"
  #get "sessions/destroy"

  #resources :user1s

#  get "search/index"
  #post "search/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
