class Pram < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos

  validates  :price, presence: true, numericality: { only_integer: true }
  validates  :model, presence: true, length: { maximum: 200 }
  validates  :location, presence: true, length: { maximum: 200 }
  validates  :brand, presence: true, length: { maximum: 200 }
  validates  :description, presence: true, length: { maximum: 200 }
  validates  :year, presence: true, numericality: { only_integer: true }

  def unavailable_dates
    bookings.pluck(:start_day, :end_day).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
