require_relative '_form'

class CreateProductPage < SitePrism::Page
  set_url '/products/new'
  section :form, Form, '[action="/products"]'
end