FactoryBot.define do
  factory :product do
    title { Faker::Creature::Animal.name.capitalize }
    description { Faker::Lorem.paragraph_by_chars(number: rand(100..200), supplemental: true) }
    image_url { Faker::File.file_name(ext: [:jpg, :gif, :png].sample) }
    price { Faker::Commerce.price }
  end
end