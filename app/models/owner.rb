class Owner < ApplicationRecord
  has_many :dogs

  def to_s
    "#{first_name} #{last_name}"
  end
end
