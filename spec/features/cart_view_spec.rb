require 'rails_helper'
require_relative 'feature_helpers'

feature "On cart page" do
  before do
    @cart_page = render_cart_page
  end

  scenario "erase cart" do
    @cart_page.erase_cart

    expect(@cart_page.has_text?("Your cart is empty")).to be_truthy
  end

  scenario "continue purchase" do
    @cart_page.continue_purchase

    expect(@cart_page.current_path).to be_eql store_index_path
  end

  scenario "confirm order" do
    @cart_page.confirm_order

    expect(@cart_page.current_path).to be_eql new_order_path
  end
end
