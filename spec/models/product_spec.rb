require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    subject { create(:product) }
  end

  context "have incorrect attribute" do
    it "creates product with zero price" do
      subject.price = 0.00
      expect(subject).to be_invalid
    end

    it "creates product without price" do
      subject.price = nil
      expect(subject).to be_invalid
    end

    it "creates product without description" do
      subject.description = nil
      expect(subject).to be_invalid
    end

    it "creates product without image" do
      subject.image_url = nil
      expect(subject).to be_invalid
    end
  end

  context "title not uniquess" do
    before do
      @duplicate = create(:product)
      @duplicate.title = subject.title
    end

    it 'create duplicate product' do
      expect(@duplicate.save).to be_falsey
    end
  end
end
