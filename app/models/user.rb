class User < ApplicationRecord

  self.primary_key = "phone"

  # validaciones
  validates :name,
    presence: true,
    length: { maximum: 128 }

  validates :lastname,
    presence: true,
    length: { maximum: 128 }

  validates :email,
    presence:    true,
    length:     { maximum: 128 },
    uniqueness: true

  validates :phone,
    presence:   true,
    length:     { maximum: 32 },
    uniqueness: true

  validates :address,
    presence: true,
    length:   { maximum: 256 }

end
