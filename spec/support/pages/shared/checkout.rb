class ProductTable < SitePrism::Section
  # elements :line_items, 
end

class CheckoutPage < SitePrism::Page
  section :product_table, ProductTable, '#Cart'
end