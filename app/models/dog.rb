class Dog < ApplicationRecord
  has_many :patients
  has_many :vets, through: :patients
  has_many :instructions
  has_one_attached :profile_picture
  belongs_to :user

  validates :size, inclusion: { in: %w(small medium large) }
  validates :name, presence: true, length: { maximum: 30 }
  validates :breed, presence: true, length: { maximum: 30 }
  validates :user_id, presence: true
  validates :username, uniqueness: true, length: { maximum: 30 }, 
    format: { with: /\A[a-z0-9]+\z/ , message: "can only contain lowercase letters and digits 0 to 9" }
  validate :birthday_cannot_be_in_future

  private

  def birthday_cannot_be_in_future
    if self.birthday >= Time.now
      errors.add(:birthday, "is in the future so the dog doesn't exist yet!")
    end
  end
end
