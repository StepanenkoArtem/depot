Rails.application.routes.draw do
  resources :orders
  root 'store#index', as: 'store_index'
  get "/store/:id", to: "store#show", as: 'store_item_id'

  post "/checkout/", to: "carts#checkout", as: "checkout"
  get  "/checkout/", to: "carts#checkout"
  patch "/cart/erase/", to: "carts#erase", as: "cart_erase"

  post "/thank-you", to: "orders#show", as: "thank_you"
  get "/thank-you", to: "orders#show"
  post "/orders/new", to: "orders#new"
  post "/line_items/", to: "line_items#create"

  resources :store
  resources :products
end
