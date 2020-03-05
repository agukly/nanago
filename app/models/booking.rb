class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pram
  has_one :review

  validates  :start_day, presence: true
  validates  :end_day, presence: true

end
