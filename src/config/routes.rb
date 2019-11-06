Rails.application.routes.draw do
  resources :store
  resources :tattoos
  
  devise_for :users, controllers: {
    application: 'application'
  }
  # root 'store#index'
  root 'tattoos#index'
  # resources :home, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end