json.extract! order, :id, :name, :address, :phone, :email, :payment_method, :created_at, :updated_at
json.url order_url(order, format: :json)
