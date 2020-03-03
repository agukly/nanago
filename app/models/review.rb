class Review < ApplicationRecord
  belongs_to :booking
  validates :score, presence: true, numericality: { only_integer: true, bigger_than: 0, less_than: 6 }
  validates :comment, length: { maximum: 200 }
end
