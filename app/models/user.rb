class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :prams
  has_many :reviews, through: :bookings

  validates :first_name, presence: true, length: { minimum: 2}
  validates :last_name, presence: true, length: { minimum: 2}
  validates :email, presence: true, uniqueness: true

end
