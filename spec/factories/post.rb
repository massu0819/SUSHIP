FactoryBot.define do
  factory :post do
    name { Faker::Lorem.characters(number:10) }
    address { Faker::Lorem.characters(number:30) }
    caption { Faker::Lorem.characters(number:30) }
    postimage_id { Faker::Lorem.characters(number:10) }
    customer
  end
end