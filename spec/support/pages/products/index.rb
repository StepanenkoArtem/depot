class ProductsIndexPage < SitePrism::Page
  set_url '/products/'

  elements :product_items, "tbody tr"
end