Rails.application.routes.draw do
  root 'homepage#index'
  namespace :api do
    namespace :v1 do
      resources :albums, only: [:index]
    end
  end
end
