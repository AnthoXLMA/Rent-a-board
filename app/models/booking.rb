class Booking < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :boards, join_table: 'board_bookings'

  validates :start_on, :end_on, presence: true #:total_price, :status,
  validates :start_on, :end_on, format: { with: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/ }
  validates :total_price, numericality: true

  enum status: [:shipped, :being_packed, :complete, :cancelled]

  scope :created_before, ->(time) { where('created_at < ?', time) }
end
