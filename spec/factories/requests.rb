FactoryBot.define do

  factory :request do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
    sequence(:code) { |n| "code_#{n}" }
    status true
  end

end
