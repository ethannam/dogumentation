class Vet < ApplicationRecord
  has_many :patients
  has_many :dogs, through: :patients

  validates :last_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates_format_of :phone_num, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/

  def to_s
    "Dr. #{last_name}"
  end
end
