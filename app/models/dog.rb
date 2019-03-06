class Dog < ApplicationRecord
  has_many :patients
  has_many :vets, through: :patients
  has_many :instructions
  belongs_to :user

  validates :size, inclusion: { in: %w(small medium large) }
  validates :name, presence: true, length: { maximum: 30 }
  validates :breed, presence: true, length: { maximum: 30 }
  validates :user_id, presence: true
  validates :username, uniqueness: true, length: { maximum: 30 }
end
