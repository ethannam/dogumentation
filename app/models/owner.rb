class Owner < ApplicationRecord
  has_many :dogs

  validates :first_name, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, presence: true
  validates_format_of :phone_num, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/


  def to_s
    "#{first_name} #{last_name}"
  end
end
