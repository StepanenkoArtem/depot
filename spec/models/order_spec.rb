require 'rails_helper'

INVALID_EMAILS = [
  'Abc.example.com',
  'A@b@c@example.com',
  'a"b(c)d,e:f;g<h>i[j\k]l@example.com',
  'just"not"right@example.com',
  'this is"not\allowed@example.com',
  'this\ still\"not\\allowed@example.com',
  '12345678901234567890123456789012345678901234567890123456789012345346874614746@example.com',
  'i_like_underscore@but_its_not_allowed_in_this_part.example.com',
  'test/test@test.com',
  'QA[icon]CHOCOLATE[icon]@test.com]'
].freeze

RSpec.describe Order, type: :model do
  subject { build :order, :with_line_items }
  context "have at least one items" do
    it "check" do
      expect(subject.line_items.any?).to be_truthy
    end
  end

  context "email" do
    it "has invalid format" do
      INVALID_EMAILS.each do |email|
        subject.email = email
        expect(subject.save).to be_falsy
      end
    end
  end

  context "phone number" do
    it "has invalid format" do
      # replace phone field with few incorrect values
      # subject saving return false
      expect(subject.save).to be_falsy
    end
  end
end
