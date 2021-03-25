require 'rails_helper'

RSpec.feature "Products", type: :feature do
  let(:products_index) { ProductsIndexPage.new }

  scenario "display all existing products" do
    create_list(:product, 10, :with_image_url)
    products_index.load
    expect(products_index.product_items.count).to be(10)
  end

  scenario "random product_item row display all attributes" do
    item = create(:product, :with_image_url)
    products_index.load
    item_row = products_index.product_items.sample
    expect(item_row.has_text?(item.title)).to be_truthy
    expect(item_row.has_text?(item.description)).to be_truthy
    expect(item_row.has_text?(item.price)).to be_truthy
  end
end
