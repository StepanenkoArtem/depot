require 'rails_helper'
class OrderForm < SitePrism::Section
  # order form inputs
  element :name,            '#order_name'
  element :address,         '#order_address'
  element :phone,           '#order_phone'
  element :email,           '#order_email'
  element :payment_method,  '#order_payment_method'

  # order form submit
  element :submit_button, 'input[type="submit"]'

  # order form alerts
  elements :alerts, '.field_with_errors'

  def fill_with(order_data)
    name.set                order_data.name
    address.set             order_data.address
    phone.set               order_data.phone
    email.set               order_data.email
    payment_method.set      order_data.payment_method
  end

  def submit
    submit_button.click
  end
end

class NewOrderPage < SitePrism::Page
  set_url '/order/new'

  section :form, OrderForm, '[action="/orders"]'
end
