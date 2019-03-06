class User < ApplicationRecord
  has_secure_password
  has_many :dogs

  validates :username, presence: true, length: { maximum: 30 }
  validates :password_digest, presence: true
  validates :first_name, presence: true, length: { maximum: 30 }
  validates :last_name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 254 }, 
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :phone_num, presence: true, 
    format: { with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/ }

  def to_s
    "#{first_name} #{last_name}"
  end
end
