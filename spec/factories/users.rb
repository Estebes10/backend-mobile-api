FactoryBot.define do

  factory :user do
    name     Faker::Name.name
    lastname Faker::Name.last_name
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:phone) { |n,m| "442#{n}0123#{n}" }
  end

end
