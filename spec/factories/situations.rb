FactoryBot.define do

  factory :situation do
    sequence(:name) { |n| "name_#{n}" }
    sequence(:code) { |n| "code_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
    status true
    instantaneous true
    association(:event)
  end

end
