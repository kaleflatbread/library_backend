Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create]
  # get '/current_user', to: 'users#current_user'
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :create]
    end
  end
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create]
    end
  end
end
