FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    name { "name" }
    password { "password" }
    password_confirmation { "password" }
  end
end
