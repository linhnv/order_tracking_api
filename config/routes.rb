Rails.application.routes.draw do
  resources :statistics, only: [:index]
  resources :purchase_orders
  resources :orders
  resources :products
  resources :suppliers
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
