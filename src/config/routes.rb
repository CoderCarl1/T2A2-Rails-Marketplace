Rails.application.routes.draw do
  get 'orders/complete', to: "orders#complete", as: "orders_complete"
  get 'orders/cancel'
  get 'orders/:tattoo_id', to: "orders#new", as: "new_order"

  # get 'stores/splashpage'
  # , to: "stores#splashpage"

  resources :stores
  resources :tattoos
  
  devise_for :users, controllers: {
    application: 'application'
  }
  # root 'store#index'
  # root 'tattoos#index'
  root 'stores#index'
  # resources :home, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end