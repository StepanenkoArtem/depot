Rails.application.routes.draw do
  root 'store#index', as: 'store_index'

  post "/cart/view/", to: "carts#show"
  patch "/cart/erase/", to: "carts#erase"
  
  get "/thank-you", to: "orders#show", as: "thank_you"
  
  resources :line_items, only: [:create]
  resources :orders, except: [:index]
  resources :store
  resources :products
end
