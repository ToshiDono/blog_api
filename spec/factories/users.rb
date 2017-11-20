FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "user#{n}@email.com" }
  end
end
