FactoryBot.define do
  factory :order do
    name { "MyString" }
    address { "MyText" }
    phone { "MyString" }
    email { "MyString" }
    payment_method { 1 }
  end
end
