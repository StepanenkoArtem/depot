FactoryBot.define do
  factory :product do
    id { Faker::Number.number(digits: 2) }
    title { Faker::Creature::Animal.name }
    description { Faker::Lorem.paragraph_by_chars(number: rand(100..200)) }
    image_url { Faker::File.file_name( ext: %w[jpg gif png].sample) }
    price { Faker::Commerce.price(range: 0..100.0) }
  end
end
