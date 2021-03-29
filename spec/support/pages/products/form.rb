class Form < SitePrism::Section
  # form inputs elements
  element :title,         '#product_title'
  element :description,   '#product_description'
  element :image_url,     '#product_image_url'
  element :price,         '#product_price'

  # form submit button
  element :submit_button, '[type="submit"]'

  # form input alerts when invalid values was inputed
  element :title_alert,         '.field_with_errors > #product_title'
  element :description_alert,   '.field_with_errors > #product_description'
  element :image_alert,         '.field_with_errors > #product_image_url'
  element :price_alert,         '.field_with_errors > #product_price'

  def fill_with(product)
    title.set       product.title
    description.set product.description
    image_url.set   product.image_url
    price.set       product.price
  end

  def submit
    submit_button.click
  end
end

class CreateProductPage < SitePrism::Page
  set_url '/products/new'
  section :form, Form, '[action="/products"]'
end

class EditProductPage < SitePrism::Page
  set_url '/products/{product_id}/edit'
  section :form, Form, '[action^="/products/"]'
end

class ViewProductPage < SitePrism::Page
  set_url "/products{/product_id}"
end
