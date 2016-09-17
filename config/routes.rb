Rails.application.routes.draw do
root 'dashboard#dashboard'

namespace :admin do
  resources :users do
    get 'index'
    get 'make_admin'
  end
  get 'index' 
end

#page
  get 'page/home'
  get 'page/about'
  get 'page/contact'
  get 'dashboard/dashboard'

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :products
  resources :users

  get '/product'=>'users#product'
  get '/userpage' => 'users#userpage'
  
  controller :sessions do
  end

  controller :users do
    get 'Make admin' => :makeadmin
  end


  match ':controller(/:action(/:id))', :via => :get
end
