class Event < ApplicationRecord

  # asociaciones
  belongs_to :request

  # validaciones
  validates :name,
    presence: true,
    length: { maximum: 128 }

  validates :description,
    length: { maximum: 1024 }

  validates :status,
    inclusion: { in: [true, false] }

  validates :code,
    presence:   true,
    uniqueness: true,
    length:     { maximum: 16 }

end
