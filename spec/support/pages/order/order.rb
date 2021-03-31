require 'rails_helper'

class NewOrderPage < SitePrism::Page
  set_url '/order/new'

  element :name, '#order_name'
  element :address, '#order_address'
  element :phone, '#order_phone'
  element :email, '#order_email'
  element :payment_method, '#order_paymen_method'

  element :submit, 'input[type="submit"]'
end