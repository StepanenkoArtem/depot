class ProductsIndexPage < SitePrism::Page
  set_url '/products/'

  elements :rows, "tbody tr"
end
