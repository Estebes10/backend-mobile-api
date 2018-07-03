class Situation < ApplicationRecord

  # asociaciones
  belongs_to :event

  # validaciones
  validates :name,
    presence: true,
    length:   { maximum: 128 }

  validates :description,
    length: { maximum: 1024 }

  validates :status,
    inclusion: { in: [true, false] }

  validates :instantaneous,
    inclusion: { in: [true, false] }

  validates :code,
    presence:   true,
    uniqueness: true,
    length:     { maximum: 16 }

end
