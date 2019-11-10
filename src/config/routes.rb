Rails.application.routes.draw do
  get 'orders/complete', to: "orders#complete", as: "orders_complete"
  get 'orders/cancel'
  get 'orders/:tattoo_id', to: "orders#new", as: "new_order"


  resources :tattoos
  devise_for :users, controllers: {
    application: 'application'
  }

  root 'tattoos#index'
end