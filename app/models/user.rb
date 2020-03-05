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

  def messaging_with(conversation)
    current_user = self
    if current_user.id == conversation.sender_id
      return User.find(conversation.recipient_id)
    else
      return User.find(conversation.sender_id)
    end
  end

end
