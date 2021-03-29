require 'rails_helper'

feature "Display products" do
  let(:products_page) { ProductsIndexPage.new }

  scenario "all existing products" do
    create_list(:product, 10, :with_image_url)
    products_page.load
    # check products table contain 10 rows of products
    expect(products_page.rows.count).to be(10)
  end

  scenario "random product with attributes" do
    # create single product instance
    @product = create(:product, :with_image_url)
    products_page.load
    # get row contains attributes of product from table
    @row = products_page.rows.sample
    # check all attrubute presence in product table row
    expect(@row.has_text?(@product.title)).to       be_truthy
    expect(@row.has_text?(@product.description)).to be_truthy
    expect(@row.has_text?(@product.price)).to       be_truthy
  end
end

feature "create product" do
  let(:create_product_page) { CreateProductPage.new }
  let(:view_product_page) { ViewProductPage.new }

  # generete product with correct attributes without saving to db
  let(:product_example) { build(:product, :with_image_url) }

  scenario "with valid attributes" do
    create_product_page.load
    # fill the form with product example
    create_product_page.form.fill_with(product_example)
    create_product_page.form.submit
    # check product attribute displayed on product page
    expect(page.has_text?(product_example.title)).to        be_truthy
    expect(page.has_text?(product_example.description)).to  be_truthy
    expect(page.has_text?(product_example.price)).to        be_truthy
  end

  scenario "with invalid description" do
    # make products description empty
    product_example.description = ""

    create_product_page.load

    # fill the form with product example
    create_product_page.form.fill_with(product_example)
    create_product_page.form.submit

    # Current page path should still be the same
    # expect(page.current_path).to be_eql create_product_page.url

    # And description error alert should be displayed
    expect(create_product_page.form.has_description_alert?).to be_truthy
  end

  scenario "with invalid price" do
    # make products description empty
    product_example.price = ""

    create_product_page.load

    # fill the form with product example
    create_product_page.form.fill_with(product_example)
    create_product_page.form.submit

    # Current page path should still be the same
    # Routes for that test passing should b refactored
    # expect(page.current_path).to be_eql create_product_page.url

    # And description error alert should be displayed
    expect(create_product_page.form.has_price_alert?).to be_truthy
  end
end

feature "edit product" do
  let(:edit_product_page) { EditProductPage.new }

  # create product before tests
  let(:product_example) { create(:product, :with_image_url) }

  # generate new valid attributes for products
  let(:new_attributes) { build(:product, :with_image_url) }

  scenario "with valid attributes" do
    edit_product_page.load product_id: product_example.id
    # fill the form with new attributes
    edit_product_page.form.fill_with(new_attributes)
    edit_product_page.form.submit
    # check product attribute displayed on product page
    expect(page.has_text?(new_attributes.title)).to        be_truthy
    expect(page.has_text?(new_attributes.description)).to  be_truthy
    expect(page.has_text?(new_attributes.price)).to        be_truthy
  end

  scenario "with invalid description" do
    # make products title empty
    product_example.title = ""

    edit_product_page.load(product_id: product_example.id)

    # fill the form with product example
    edit_product_page.form.fill_with(product_example)
    edit_product_page.form.submit

    # Current page path should still be the same
    # Routes for that test passing should b refactored
    # expect(page.current_path).to be_eql create_product_page.url

    # And description error alert should be displayed
    expect(edit_product_page.form.has_title_alert?).to be_truthy
  end

  scenario "with invalid price" do
    # make products description empty
    product_example.price = 0.00

    edit_product_page.load(product_id: product_example.id)

    # fill the form with product example
    edit_product_page.form.fill_with(product_example)
    edit_product_page.form.submit

    # Current page path should still be the same
    # expect(page.current_path).to be_eql create_product_page.url

    # And description error alert should be displayed
    expect(edit_product_page.form.has_price_alert?).to be_truthy
  end
end
