require_relative '../shared/header'

class StoreProductCard < SitePrism::Section
  element :image, "img.img-thumbnail"
  element :title, "h5.card-title"
  element :description, ".card-text"
  element :price, ".card-footer > .h4"

  element :add_to_cart, 'input[type="submit"]'
end

class StoreProductIndex < SitePrism::Page
  set_url '/'
  section :header, Header, 'header'
  sections :cards, StoreProductCard, '.card'
end