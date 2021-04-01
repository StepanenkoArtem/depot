require 'rails_helper'
require_relative 'feature_helpers'

feature 'Order confirm' do
  before do
    @cart_page = render_cart_page
    @order_page = @cart_page.confirm_order
  end
  scenario "with valid order data" do
    @valid_order_data = build(:order)
    @order_page.form.fill_with(@valid_order_data)
    @order_page.form.submit

    expect(page.current_path).to be_eql thank_you_path
  end

  scenario "with empty filled form" do
    @invalid_order_data = build(:order, :with_invalid_data)
    @order_page.form.fill_with(@invalid_order_data)
    @order_page.form.submit

    expect(page.current_path).to              be_eql(@order_page.current_path)
    expect(@order_page.form.has_alerts?).to   be_truthy
  end
end
