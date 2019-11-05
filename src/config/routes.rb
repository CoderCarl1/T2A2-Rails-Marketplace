Rails.application.routes.draw do
  resources :store
  
  devise_for :users, controllers: {
    application: 'application'
  }
  root 'store#index'
  # resources :home, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end