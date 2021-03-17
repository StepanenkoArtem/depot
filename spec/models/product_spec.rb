require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = create(:product)
  end

  context "have incorrect attribute" do
    it "creates product with zero price" do
      @product.price = 0.00
      expect(@product).to be_invalid
    end

    it "creates product without price" do
      @product.price = nil
      expect(@product).to be_invalid
    end

    it "creates product without description" do
      @product.description = nil
      expect(@product).to be_invalid
    end

    it "creates product without image" do
      @product.image_url = nil
      expect(@product).to be_invalid
    end
  end

  context "title not uniquess" do
    it 'create duplicate product' do
      @duplicate = create(:product)
      @duplicate.title = @product.title
      expect(@duplicate.save).to be_falsey
    end
  end
end

