class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :boards
  # has_many :board_requests, through: :boards, source: :bookings

  has_one :owner, dependent: :destroy
  accepts_nested_attributes_for :owner

  has_many :bookings
  # has_many :reviews

  has_one_attached :photo

  validates :first_name, :last_name, presence: true
  # validates :phone_number, uniqueness: true, numericality: { only_integer: true }
end
