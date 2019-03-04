class Patient < ApplicationRecord
  belongs_to :vet
  belongs_to :dog
end
