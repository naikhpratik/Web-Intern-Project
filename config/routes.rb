Rails.application.routes.draw do
root 'dashboard#index'

get '/admin', to: 'admin/users#index'
get '/dashboard', to: 'dashboard#index'

namespace :admin do
  resources :users do
    member do
      get 'assign_products'
      post 'create_products'
    end
  end

  resources :products
  resources :roles, only: [:show]
end

  resources :contents


#page
  get 'page/home'
  get 'page/about'
  get 'page/contact'

  devise_for :users, :controllers => { registrations: 'users/registrations' }

  resources :products, only: [:index, :show]

  mount Ckeditor::Engine => '/ckeditor'
end
