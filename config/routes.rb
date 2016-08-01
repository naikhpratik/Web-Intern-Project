Rails.application.routes.draw do
  #get 'admin/index'
  #get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  #get 'users/userpage'
  resources :users
  #resources :admin
  #get 'api/index'
  get '/product'=>'users#product'
 get '/users' => 'users#index'
 get '/userpage' => 'users#userpage'
  #get 'sessions' => 'sessions#new'
  #get 'users' => 'users#new'
  #get 'search' => 'search#index'
  #get 'logout' => 'sessions#destroy'
  #get 'users' => 'users#userpage'
  get 'admin' => 'admin#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    post 'Make admin' => :makeadmin
  end

root 'sessions#new'
match ':controller(/:action(/:id))', :via => :get
  #get "sessions/create"
  #get "sessions/destroy"

  #resources :user1s

#  get "search/index"
  #post "search/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
