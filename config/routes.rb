Rails.application.routes.draw do
root 'dashboard#index'

get '/admin', to: 'admin#index'
get '/dashboard', to: 'dashboard#index'

namespace :admin do
  get 'index'

  resources :users  
  resources :products
  resources :roles
end

#page
  get 'page/home'
  get 'page/about'
  get 'page/contact'

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :products
  resources :users
end
