require 'rails_helper'

RSpec.feature "Products" do
  let(:products_index) { ProductsIndexPage.new }

  scenario "display all existing products" do
    create_list(:product, 10, :with_image_url)
    products_index.load
    expect(products_index.item_rows.count).to be(10)
  end

  scenario "random product_item row display all attributes" do
    item = create(:product, :with_image_url)
    products_index.load
    item_row = products_index.item_rows.sample
    expect(item_row.has_text?(item.title)).to be_truthy
    expect(item_row.has_text?(item.description)).to be_truthy
    expect(item_row.has_text?(item.price)).to be_truthy
  end
end
