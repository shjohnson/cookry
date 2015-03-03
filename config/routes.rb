Rails.application.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      get 'user/:id', to: 'users#show', as: :user_show
      post 'user', to: 'users#create', as: :user_create
      put 'user/:id', to: 'users#update', as: :user_edit
      delete 'user/:id', to: 'users#destroy', as: :user_delete

      get 'recipes', to: 'recipes#index', as: :recipes
      get 'recipes/:id', to: 'recipes#show', as: :recipes_show
      post 'recipes', to: 'recipes#create', as: :recipes_create
      put 'recipes/:id ', to: 'recipes#update', as: :recipes_edit
      delete 'recipes/:id', to: 'recipes#destroy', as: :recipes_delete

      resources :ingredients, except: [:new, :edit]
      resources :comments, except: [:new, :edit]
    end
  end
end
