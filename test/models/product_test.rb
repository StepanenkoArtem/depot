require "test_helper"

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  test 'product price is incorrect!' do
    product = Product.new(
      title: products(:squirel).title,
      description: products(:squirel).description,
      image_url: products(:squirel).image_url,
      price: products(:squirel).price
    )
    product.invalid?
    assert product.errors[:price].any?
  end
end
