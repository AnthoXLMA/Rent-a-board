class Booking < ApplicationRecord
  belongs_to :user, inverse_of: :bookings
  belongs_to :board, inverse_of: :bookings
  # has_and_belongs_to_many :boards, join_table: 'board_bookings'
  # validates :start_on, :end_on, presence: true #:total_price, :status,
  # validates :start_on, :end_on, format: { with: /([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))/ }
  # validates :total_price, numericality: true

  # enum status: [:shipped, :being_packed, :complete, :cancelled]

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
