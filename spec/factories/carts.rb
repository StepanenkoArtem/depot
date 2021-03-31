FactoryBot.define do
  factory :cart do
    trait :with_line_items do
      after(:create) do |cart|
        cart.line_items = create_list(:line_item, rand(1..10))
      end
    end
  end
end
