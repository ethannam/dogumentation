class Vet < ApplicationRecord
  has_many :patients
  has_many :dogs, through: :patients
end
