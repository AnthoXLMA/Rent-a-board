class Booking < ApplicationRecord
  # belongs_to :user
  belongs_to :board, inverse_of: :bookings
  # has_and_belongs_to_many :boards, join_table: 'board_bookings'
  # validates :start_on, :end_on, presence: true #:total_price, :status,
  # validates :start_on, :end_on, format: { with: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/ }
  # validates :total_price, numericality: true


  belongs_to :board
  accepts_nested_attributes_for :board

  belongs_to :schedule
  accepts_nested_attributes_for :schedule

  belongs_to :owner
  accepts_nested_attributes_for :owner

  belongs_to :customer
  accepts_nested_attributes_for :customer

  has_many :board_payments, dependent: :destroy
  accepts_nested_attributes_for :board_payments

  validates :schedule_id, presence: true

  has_many :booking_payments, dependent: :destroy
  accepts_nested_attributes_for :booking_payments

  # enum status: [:pending, :completed, :cancelled]

  # scope :created_before, ->(time) { where('created_at < ?', time) }

  # Bookings cannot be in the past
  def no_past_booking
    if Date.today > starts.to_date || Time.now > starts.to_time
      errors.add(:Starts, "cannot be in the past")
    elsif Date.today > ends.to_date || Time.now > ends.to-time
      errors.add(:Ends, "cannot be in the past")
    end
  end


  # Validation for overlapping
  def overlaps
    bookings = Bookings.where(room_id: id)
    bookings.each do |booking|
      if starts < booking.ends && booking.starts < ends
        errors.add(:overlaps, 'Already booked')
      end
    end
  end
end
