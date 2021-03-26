class ProductsIndexPage < SitePrism::Page
  set_url '/products/'

  elements :rows, "tbody tr"
end

class ProductNewPage < SitePrism::Page
  set_url '/products/new'

  element :title,         '#product_title'
  element :description,   '#product_description'
  element :image_url,     '#product_image_url'
  element :price,         '#product_price'

  element :submit_button, '[type="submit"]'

  def fill_form_with(product)
    title.set       product.title
    description.set product.description
    image_url.set   product.image_url
    price.set       product.price
  end

  def submit
    submit_button.click
  end
end

class ProductPage < SitePrism::Page
  set_url "/products{/product_id}"

  
end
