class Review < ApplicationRecord
  belongs_to :user, through: :bookings
  belongs_to :booking

  validates :score, presence: true, :inclusion {range(1..5)}, numericality: { only_integer: true }
  validates :comment, length: { maximum: 200 }
end
