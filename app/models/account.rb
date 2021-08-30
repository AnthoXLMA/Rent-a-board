class Account < ApplicationRecord
  # Users
 belongs_to :user, dependent: :destroy
 accepts_nested_attributes_for :user

 # Owners
 has_many :owners, dependent: :destroy
 accepts_nested_attributes_for :owners

 has_many :schedules, dependent: :destroy
 accepts_nested_attributes_for :schedules

 # Customers
 has_many :customers, dependent: :destroy
 accepts_nested_attributes_for :customers

 # Boards
 has_many :bookings, dependent: :destroy
 accepts_nested_attributes_for :bookings

 has_many :board_payments, dependent: :destroy
 accepts_nested_attributes_for :board_payments
end
