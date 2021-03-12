Rails.application.routes.draw do
  root 'store#index', as: 'store_index'
  get "/store/:id", to: "store#show", as: 'store_item_id'

  post "/line_items/", to: "line_items#create"

  resources :store
  resources :carts
  
  resources :products
end
