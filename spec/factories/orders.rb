FactoryBot.define do
  factory :order do
    name { Faker::Name.name }
    address { Faker::Address.full_address }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    email { Faker::Internet.email }
    payment_method { Order.payment_methods.values.sample }

    trait :with_line_items do
      after(:build) do |order|
        order.line_items = FactoryBot.create_list(:line_item, rand(1..10))
      end
    end
  end
end
