FactoryBot.define do
  factory :note do
    city { Faker::Address.city }
    note { Faker::Lorem.sentence(3, false, 4) }
    weather { 10 }
    user
  end
end