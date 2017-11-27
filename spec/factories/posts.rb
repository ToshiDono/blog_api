FactoryBot.define do
  factory :post do
    title Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    author_ip Faker::Internet.ip_v4_address
    user
    sequence(:rating) { rand(1.0..5.0) }
  end
end
