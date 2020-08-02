Rails.application.routes.draw do
  root 'homepage#index'
  namespace :api do
    namespace :v1 do
      resources :albums, only: [:index, :show]
      resources :users, only: [:show] do
        resources :albums, only: [:index]
        resource :locations, only: [:show], controller: 'locations/show'
      end
    end
  end
end
