class ReporteSerializer < ActiveModel::Serializer
  attributes :id, :date, :hour, :description, :folio, :zip_code, :folio, :street, :house_number, :colony, :requester_name, :requester_lastname, :people_involved, :user_id, :situation_id, :active, :created_at, :updated_at, :images

  has_many :images
end
