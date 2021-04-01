require 'rails_helper'
require_relative 'feature_helpers'

feature "Fill cart from store page" do
  let(:cart_page) { ViewCartPage.new }

  before do
    @store_page = render_store_page
    @store_page.load
  end

  context "without any items" do
    scenario "and try checkout it" do
      @store_page.header.checkout.click

      expect(page.current_path).to                        be_eql cart_view_path
      expect(page.has_content?("Your cart is empty")).to  be_truthy
    end
  end

  context "with few items" do
    scenario 'and try checkout it' do
      @store_page.fill_cart
      @store_page.header.checkout.click

      expect(cart_page.current_path).to                   be_eql cart_view_path
      expect(cart_page.has_confirm_order_button?).to      be_truthy
      expect(cart_page.has_erase_cart_button?).to         be_truthy
      expect(cart_page.has_continue_purchase_button?).to  be_truthy
    end
  end
end
