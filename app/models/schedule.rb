class Schedule < ApplicationRecord
  belongs_to :owner, :inverse_of => :schedules
  accepts_nested_attributes_for :owner

  # belongs_to :customer
  # accepts_nested_attributes_for :customer

  has_many :bookings, :inverse_of => :schedule
  accepts_nested_attributes_for :bookings

  validates :start, uniqueness: { scope: :owner_id, message: "You have already made this time available" }

  # amoeba do
  #   enable
  #   exclude_associations :bookings
  # end
end
