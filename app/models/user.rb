class User < ApplicationRecord
  has_many :dogs

  validates :first_name, presence: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates_format_of :phone_num, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/

  def to_s
    "#{first_name} #{last_name}"
  end
end
