class Reporte < ApplicationRecord
   serialize :attachments

   validates :folio,
     presence:   true,
     uniqueness: true

  validates :date,
    presence: true

  validates :hour,
    presence: true

  validates :active,
    inclusion: { in: [true, false] }

  validates :situation_id,
    presence: true

  validates :description,
    presence: true

end
