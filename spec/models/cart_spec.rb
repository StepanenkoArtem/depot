require 'rails_helper'

RSpec.describe Cart, type: :model do
  let(:products) { create_list(:product, 3) }

  before(:each) do
    subject { create :cart }.save
  end

  context "add" do
    it "1 product" do
      subject.add_product(products[0])
      expect(subject.line_items.size).to be(1)
    end

    it "some product twice" do
      some_product = products.entries.sample
      subject.add_product(some_product)
      subject.save
      subject.add_product(some_product)
      expect(subject.line_items.size).to be(1)
    end

    it "some different products" do
      subject.add_product(products.shuffle!.pop)
      subject.save
      subject.add_product(products.shuffle!.pop)
      expect(subject.line_items.size).to be(2)
    end
  end

  context "total" do
    before do
      products[0].price = 4.50
      products[0].save
      products[1].price = 3.50
      products[1].save
    end
    it "is correct" do
      subject.add_product(products[0])
      expect(subject.total).to eq(4.50)
      subject.add_product(products[0])
      expect(subject.total).to eq(9.00)
      subject.add_product(products[1])
      expect(subject.total).to eq(12.50)
    end
  end

  context "erase" do
    before do
      products.map do |product|
        subject.add_product(product)
      end
      subject.save
    end
    it "check" do
      expect(subject.line_items.any?).to be_truthy
      subject.erase
      subject.save
      expect(subject.line_items.empty?).to be_truthy
    end
  end
end
