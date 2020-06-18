class Kitten < ApplicationRecord
  validates :name, :age, :softness, presence: true
end
