class Dog < ApplicationRecord
  has_many :patients
  has_many :vets, through: :patients
  has_many :instructions
  belongs_to :user

  validates :size, inclusion: { in: %w(small medium large) }
  validates :name, presence: true
  validates :breed, presence: true
  validates :user_id, presence: true
  validates :username, uniqueness: true
end
