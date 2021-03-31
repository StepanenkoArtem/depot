class ProductTable < SitePrism::Section
  # elements :line_items
end

class ViewCartPage < SitePrism::Page
  set_url 'cart/view'
  section :product_table, ProductTable, '#Cart'

  element :erase_cart, 'input[value="Erase cart"]'
  element :continue_purchase, 'input[value="Continue purchase.."]'
  element :confirm_order, 'input[value="Confirm order"]'
end
