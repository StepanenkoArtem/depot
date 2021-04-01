FactoryBot.define do
  factory :product do
    id { Faker::Number.number }
    title { "#{Faker::Creature::Animal.name} #{Faker::Number.number(digits: 3)}" }
    description { Faker::Lorem.paragraph_by_chars(number: rand(100..200)) }
    image_url { '300.svg' }
    price { Faker::Commerce.price(range: 0.01..100.0) }

    trait :with_invalid_attrs do
      title { '' }
      description { '' }
      image_url { '' }
      price { 0.00 }
    end
  end
end
