require 'rails_helper'

RSpec.describe Product, type: :model do
  it "should be valid" do
    @test_product = create(:product)
    expect(@test_product).to be_valid
  end

  it "should have not zero price" do
    @test_product = build(:product, price: 0.00)
    expect(@test_product).not_to be_valid
  end
end
