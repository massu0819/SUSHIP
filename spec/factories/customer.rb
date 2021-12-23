FactoryBot.define do
  factory :customer do
    nickname { Faker::Lorem.characters(number:10) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }
    age { '20' }
    gender { 'man' }
  end
end