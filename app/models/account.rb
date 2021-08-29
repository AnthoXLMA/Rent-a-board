class Account < ApplicationRecord
  # Users
 has_many :users, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :users

 # Owners
 has_many :owners, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :owners

 has_many :schedules, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :schedules

 # Customers
 has_many :customers, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :customers

 # Boards
 has_many :bookings, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :bookings

 has_many :board_payments, dependent: :destroy, :inverse_of => :account
 accepts_nested_attributes_for :board_payments
end
