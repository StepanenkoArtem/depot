FactoryBot.define do
  factory :line_item do
    product
    quantity { rand(1..10) }
  end
end
