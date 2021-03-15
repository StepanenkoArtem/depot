FactoryBot.define do
  factory :product do
    title { Faker::Name.name }
    description { Faker::Lorem.paragraphs }
    image_url { Faker::File.file_name(ext: [:jpg, :gif, :png].sample) }
    price { Faker::Commerce.price }
  end
end