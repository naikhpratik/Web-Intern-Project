Rails.application.routes.draw do
root 'dashboard#dashboard'

namespace :admin do
  get 'index'

  resources :users do
    get 'index'
    get 'make_admin'
  end
  
  resources :products
  resources :roles
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
end
