FactoryBot.define do

  factory :reporte do
    date "2018-07-10"
    hour "2018-07-10 20:15:23"
    sequence(:description) { |n| "descripcion_#{n}" }
    attachments { }
    sequence(:folio) { |n| "100000#{n}" }
    user_id 1
    situation_id 1
  end

end
