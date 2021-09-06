class Customer < ApplicationRecord
  has_many :bookings
  has_many :reviews

  belongs_to :user
  accepts_nested_attributes_for :user

  belongs_to :account
  accepts_nested_attributes_for :account

  has_many :bookings, dependent: :destroy
  accepts_nested_attributes_for :bookings

  has_many :boards, :through => :bookings

  has_many :board_payments
end
