require 'rails_helper'

feature "Success checkout" do
  let(:order) { build :order, :with_line_items }
  let(:new_order_page) { NewOrderPage.new }

  # before { assign :new_order_page, :order }
  scenario "with correct order values" do
    new_order_page.load
    byebug
    # visit to checkout page
    # fill form with correct values
    # click confirm
    # check is the page has path for thank_you page
    expect(page.current_path).to be_eql '/thank-you'
  end
end

feature "Failed checkout" do
  scenario "with empty filled form" do
    # add some item to cart
    # visit to checkout page
    # # click confirm without filling any fields
    # check is the page has alerts
  end
end
