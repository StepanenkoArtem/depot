require 'rails_helper'

def prepare_cart
  create_list(:product, 10, :with_image_url)
  index_product_page = StoreProductIndex.new
  index_product_page.load
  index_product_page.cards.sample.add_to_cart.click
  index_product_page.header.checkout.click
end

feature "cart view" do
  let(:view_cart_page) { ViewCartPage.new }

  before(:each) do
    prepare_cart
  end

  scenario "erase cart" do
    view_cart_page.erase_cart.click
    expect(view_cart_page.has_text?("Your cart is empty")).to be_truthy
  end

  scenario "continue purchase" do
    view_cart_page.continue_purchase.click
    expect(page.current_path).to be_eql store_index_path
  end

  scenario "confirm_order" do
    view_cart_page.confirm_order.click
    expect(page.current_path).to be_eql new_order_path
  end
end