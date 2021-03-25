FactoryBot.define do
  factory :product do
    id { Faker::Number.number }
    title { "#{Faker::Creature::Animal.name} #{Faker::Number.number(digits: 3)}" }
    description { Faker::Lorem.paragraph_by_chars(number: rand(100..200)) }
    image_url { Faker::File.file_name(ext:%w[jpg gif png].sample) }
    price { Faker::Commerce.price(range: 0..100.0) }

    trait :with_image_url do
      image_url { '300.svg' }
    end
  end
end
