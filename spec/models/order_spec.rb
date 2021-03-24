require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { create :order }
  context "have at least one items" do
    it "check" do
      expect(subject.line_items.any?).to be_truthy
    end
  end
end
