class ProductRow < SitePrism::Section
  element :show_button, 'a[href^="/products/*"]'
  element :edit_button, 'a[href$="edit"]'
  element :destroy_button, '[data-method="delete"]'
end

class IndexProductPage < SitePrism::Page
  set_url '/products/'

  sections :items, ProductRow, "tbody tr"
end
