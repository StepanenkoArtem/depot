require 'rails_helper'
require_relative 'feature_helpers'

feature "/products" do
  let(:all_products_page) { IndexProductPage.new }

  before { generate_products }

  context "display" do
    scenario "all" do
      all_products_page.load

      expect(all_products_page.has_items?).to be_truthy
    end

    scenario "random product with attributes" do
      @product = create(:product)
      all_products_page.load

      expect(all_products_page.has_text?(@product.title)).to       be_truthy
      expect(all_products_page.has_text?(@product.description)).to be_truthy
      expect(all_products_page.has_text?(@product.price)).to       be_truthy
    end
  end

  context "create" do
    let(:create_product_page) { CreateProductPage.new }
    let(:view_product_page) { ViewProductPage.new }

    scenario "with valid attributes" do
      @product_example = build(:product)

      create_product_page.load
      create_product_page.form.fill_with(@product_example)
      create_product_page.form.submit

      expect(page.has_text?(@product_example.title)).to           be_truthy
      expect(page.has_text?(@product_example.description)).to     be_truthy
      expect(page.has_text?(@product_example.price)).to           be_truthy
    end

    scenario "with invalid attributes" do
      @product_example = build(:product, :with_invalid_attrs)

      create_product_page.load
      create_product_page.form.fill_with(@product_example)
      create_product_page.form.submit

      expect(create_product_page.form.has_alerts?).to be_truthy
    end
  end

  context "edit" do
    let(:edit_product_page) { EditProductPage.new }
    let(:product_example) { create :product }

    scenario "with valid attributes" do
      @valid_attributes = build(:product)
      edit_product_page.load(product_id: product_example.id)
      edit_product_page.form.fill_with(@valid_attributes)
      edit_product_page.form.submit

      expect(page.has_text?(@valid_attributes.title)).to        be_truthy
      expect(page.has_text?(@valid_attributes.description)).to  be_truthy
      expect(page.has_text?(@valid_attributes.price)).to        be_truthy
    end

    scenario "with invalid attributes" do
      @invalid_attributes = build(:product, :with_invalid_attrs)
      edit_product_page.load(product_id: product_example.id)
      edit_product_page.form.fill_with(@invalid_attributes)
      edit_product_page.form.submit

      expect(edit_product_page.form.has_alerts?).to be_truthy
    end
  end

  context "delete" do
    scenario "existing product" do
      all_products_page.load
      @items_count_before = all_products_page.items.count
      all_products_page.items.sample.destroy_button.click

      expect(all_products_page.items.count).to be == (@items_count_before - 1)
    end
  end
end
