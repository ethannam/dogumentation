class Dog < ApplicationRecord
  has_many :patients
  has_many :vets, through: :patients
  has_many :instructions
  belongs_to :owner

  validates :size, inclusion: { in: %w(small medium large) }
  validates :name, presence: true
  validates :breed, presence: true
  validates :owner_id, presence: true
end
