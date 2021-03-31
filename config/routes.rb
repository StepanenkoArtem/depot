Rails.application.routes.draw do
  resources :orders, except: [:new]
  root 'store#index', as: 'store_index'
  get "/store/:id", to: "store#show", as: 'store_item_id'

  post "/cart/view/", to: "carts#show"
  get  "/cart/view/", to: "carts#show"
  patch "/cart/erase/", to: "carts#erase", as: "cart_erase"

  post "/thank-you", to: "orders#show", as: "thank_you"
  get "/thank-you", to: "orders#show"
  post "/order/new", to: "orders#new", as: 'new_order'
  post "/line_items/", to: "line_items#create"

  resources :store
  resources :products
end
