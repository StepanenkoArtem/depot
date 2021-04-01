require 'rails_helper'

class ProductTable < SitePrism::Section
  # elements :line_items
end

class ViewCartPage < SitePrism::Page
  set_url 'cart/view{/params}'

  section :product_table, ProductTable, '#Cart'

  element :erase_cart_button, 'input[value="Erase cart"]'
  element :continue_purchase_button, 'input[value="Continue purchase.."]'
  element :confirm_order_button, 'input[value="Confirm order"]'

  def confirm_order
    confirm_order_button.click
    NewOrderPage.new
  end

  def erase_cart
    erase_cart_button.click
  end

  def continue_purchase
    continue_purchase_button.click
  end
end
