class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :prams
  has_many :reviews, through: :bookings
  
  has_one_attached :photo

  validates :first_name, presence: true, length: { minimum: 2}
  validates :last_name, presence: true, length: { minimum: 2}
end
