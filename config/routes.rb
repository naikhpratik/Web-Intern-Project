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
          get 'get_user_roles'
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
        resources :flashcards do
          member do
            get 'update_flashcard_item_position'
          end
        end
        resources :htmls, path: 'html'
        resources :quizzes do
          get 'download'
          post 'upload'
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
