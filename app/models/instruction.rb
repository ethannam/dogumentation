class Instruction < ApplicationRecord
  belongs_to :dog

  validates :header, presence: true
  validates :content, presence: true
  validates :dog_id, presence: true
end
