FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { "abc123" }
    password_confirmation { "abc123" }
  end
end