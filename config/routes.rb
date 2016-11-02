Rails.application.routes.draw do
  root 'dashboard#index'

  get '/admin', to: 'admin/users#index'
  get '/dashboard', to: 'dashboard#index'

  #page
  get 'page/home'
  get 'page/about'
  get 'page/contact'

  # Admin
  namespace :admin do
    resources :users do
      member do
        get 'assign_products'
        post 'create_products'
      end
    end

    resources :products do
      resources :content_managers, shallow: true do
        collection do
          post 'permissions'
          post 'update_permissions'
          post 'destroy_permissions'
        end
      end
    end

    resources :contents
    resources :roles, only: [:show]
  end

  resources :products, only: [:index, :show]

  # Devise
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  
  # Ckeditor
  mount Ckeditor::Engine => '/ckeditor'
end
