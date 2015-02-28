Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'user/:id', to: 'users#show', as: :user_show
      post 'user', to: 'users#create', as: :user_create
      put 'user/:id', to: 'users#update', as: :user_edit
      delete 'user/:id', to: 'users#destroy', as: :user_delete

      resources :recipes, except: [:new, :edit]
      resources :ingredients, except: [:new, :edit]
      resources :comments, except: [:new, :edit]
    end
  end
end
