FactoryBot.define do

  factory :reporte do
    date               "2018-07-10"
    hour               "2018-07-10 20:15:23"
    sequence(:description) { |n| "descripcion_#{n}" }
    attachments { }
    sequence(:folio) { |n| "100000#{n}" }
    street             Faker::Address.street_name
    zip_code           Faker::Address.zip_code
    colony             Faker::Address.city
    requester_name     Faker::Name.first_name
    requester_lastname Faker::Name.last_name
    people_involved { }
    user_id 1
    situation_id 1
  end

end
