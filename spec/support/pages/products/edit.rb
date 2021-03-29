require_relative '_form'

class EditProductPage < SitePrism::Page
  set_url '/products/{product_id}/edit'
  section :form, Form, '[action^="/products/"]'
end