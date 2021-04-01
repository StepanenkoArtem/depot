require 'rails_helper'

def generate_products
  create_list(:product, 10)
end

def render_store_page
  generate_products
  StoreIndex.new
end

def render_cart_page
  store_page = render_store_page

  store_page.load
  store_page.fill_cart
  store_page.header.checkout.click
  ViewCartPage.new
end
