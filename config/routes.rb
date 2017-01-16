  Rails.application.routes.draw do
  root 'dashboard#index'

  get '/admin', to: 'admin/users#index'
  get '/dashboard', to: 'dashboard#index'

  #page
  get 'page/home'
  get 'page/about'
  get 'page/contact'

  #diagnostics
  get 'healthcheck', to: 'diagnostics#healthcheck'

  # Admin
  namespace :admin do
      resources :users do
        member do
          get 'assign_products'
          post 'create_products'
        end
      end

      resources :products do
        post 'import'
        resources :contributions, shallow: true do
          collection do

            post 'permissions'
            post 'update_permissions'
            post 'destroy_permissions'
          end
        end

        resources :modulees, path: 'modules'
        resources :flashcards
        resources :htmls, path: 'html' do
          member do
            get 'preview'
          end
        end
        resources :media
      end

      resources :contents do
        collection do
          get 'update_content_position'
        end

        post 'usercontentssave'
        post 'usercontentsupdate'
        resources :contributions, shallow: true do
          collection do
            post 'permissions'
            post 'update_permissions'
            post 'destroy_permissions'

          end
        end

      end

      resources :roles, only: [:show]
  end

  resources :products, only: [:index, :show]

  # Devise
  devise_for :users, :controllers => { registrations: 'users/registrations' }

  # Ckeditor
  mount Ckeditor::Engine => '/ckeditor'
end
