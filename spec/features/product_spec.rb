require 'rails_helper'

feature "Display" do
  let(:all_products) { ProductsIndexPage.new }
  scenario "all existing products" do
    # create 10 test products
    create_list(:product, 10, :with_image_url)
    all_products.load
    # check products table contain 10 rows of products
    expect(all_products.rows.count).to be(10)
  end

  scenario "random product with attributes" do
    # create single product instance
    @product = create(:product, :with_image_url)
    all_products.load
    # get row contains attributes of product from table
    @row = all_products.rows.sample
    # check all attrubute presence in table row
    expect(@row.has_text?(@product.title)).to be_truthy
    expect(@row.has_text?(@product.description)).to be_truthy
    expect(@row.has_text?(@product.price)).to be_truthy
  end
end

feature "create" do
  let(:product_new_page) { ProductNewPage.new }
  let(:product_page) { ProductPage.new }
  # generete product with correct attributes
  let(:product_example) { build(:product, :with_image_url) }

  scenario "with valid attributes" do
    product_new_page.load
    # fill the form with product example
    product_new_page.fill_form_with(product_example)
    product_new_page.submit
    # check product attribute displayed on product page
    expect(page.has_text?(product_example.title)).to be_truthy
    expect(page.has_text?(product_example.description)).to be_truthy
    expect(page.has_text?(product_example.price)).to be_truthy
  end
end
