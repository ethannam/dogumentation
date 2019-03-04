class Vet < ApplicationRecord
  has_many :patients
  has_many :dogs, through: :patients

  def to_s
    "Dr. #{last_name}"
  end
end
