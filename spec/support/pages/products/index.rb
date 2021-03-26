class ProductsIndexPage < SitePrism::Page
  set_url '/products/'

  elements :item_rows, "tbody tr"
end

class ProductNewPage < SitePrism::Page
  set_url '/products/new'

  element :product_title_inputit
  element :product_description_input
  element :product_image_url_input
  element :product_price_input
end