Rails.application.routes.draw do
  #get 'admin/index'
  #get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :users

  #get 'api/index'

  get 'admin' => 'admin#index'
  #get 'search' => 'search#index'
  #get 'logout' => 'sessions#destroy'

  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
root 'admin#index'
  #get "sessions/create"
  #get "sessions/destroy"

  #resources :user1s

#  get "search/index"
  #post "search/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'application#hello'
end
