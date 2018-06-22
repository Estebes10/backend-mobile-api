FactoryBot.define do

  factory :event do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
    status true
    sequence(:code) { |n| "code_#{n}" }
    association(:request)
  end

end
