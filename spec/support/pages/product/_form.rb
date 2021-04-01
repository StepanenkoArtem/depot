class Form < SitePrism::Section
  # form inputs elements
  element :title,         '#product_title'
  element :description,   '#product_description'
  element :image_url,     '#product_image_url'
  element :price,         '#product_price'

  # form submit button
  element :submit_button, '[type="submit"]'

  # form input alerts when invalid values was inputed
  elements :alerts, '.field_with_errors'

  def fill_with(product)
    title.set         product.title
    description.set   product.description
    image_url.set     product.image_url
    price.set         product.price
  end

  def submit
    submit_button.click
  end
end
