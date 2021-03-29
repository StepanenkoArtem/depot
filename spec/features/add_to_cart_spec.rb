require 'rails_helper'

feature 'Add to cart' do
  let(:store_index_page) { StoreProductIndex.new }
  let(:store_product_page) { StoreProductPage.new }

  before(:each) do
    create_list(:product, 10, :with_image_url)
    store_index_page.load
  end

  scenario 'random items from index store' do
    # add some randoms products to cart
    rand(1..5).times do
      store_index_page.cards.sample.add_to_cart.click
    end
    # click checkout button
    store_index_page.header.checkout.click
    expect(page.current_path).to be_eql '/checkout'
  end

  scenario 'add items either from store index page and product page' do
    # add random item to cart
    # visit to random product card and then add it to card
    # return to store index page
    # add random item to cart
    # visit to checkout page
    # check checkut page has item titles, correct pieces and total sum
  end

  scenario 'checkout with empty cart' do
    # click to checkout button while any items ware not added
    store_index_page.header.checkout.click
    # check loaded page has text that cart is empty
    expect(page.current_path).to be_eql '/checkout'
    expect(page.has_text?('Your cart is empty')).to be_truthy
  end
end
