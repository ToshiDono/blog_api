FactoryBot.define do
  factory :rating do
    sequence(:estimation) { rand(1..5) }
    post
  end
end
