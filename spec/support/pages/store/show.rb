class StoreProductPage < SitePrism::Page
  set_url_matcher '/store/$'

  element :title, 'h1'
  element :img, '.img-fluid'
  element :description, '.img-fluid + div'
  element :price, 'h4'

  element :add_to_cart, 'input[type="submit"]'

  section :header, Header, 'header'
end
