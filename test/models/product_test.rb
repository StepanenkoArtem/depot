require "test_helper"

class ProductTest < ActiveSupport::TestCase

  fixtures :products

  def prepare(product)
    Product.new(
      title: product.title,
      description: product.description,
      image_url: product.image_url,
      price: product.price
    )
  end

  test 'price is zero' do
    product = prepare products :invalid_zero_price
    product.invalid?
    assert product.errors[:price].any?
  end

  test 'price not numerical' do
    product = prepare products :non_numerical_price
    product.invalid?
    assert product.errors[:price].any?
  end

  test 'description is shortly' do
    product = prepare products :short_description
    product.invalid?
    assert product.errors[:description].any?
  end

  test 'invalid image url' do
    product = prepare products :invalid_image_url
    product.invalid?
    assert product.errors[:image_url].any?
  end
end
