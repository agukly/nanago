class Pram < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates  :price, presence: true, numericality: { only_integer: true }
  validates  :model, presence: true, length: { maximum: 200 }
  validates  :location, presence: true, length: { maximum: 200 }
  validates  :brand, presence: true, length: { maximum: 200 }
  validates  :description, presence: true, length: { maximum: 200 }
  validates  :year, presence: true, numericality: { only_integer: true }
end
