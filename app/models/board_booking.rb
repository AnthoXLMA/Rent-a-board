class BoardBooking < ApplicationRecord
  belongs_to :booking
  belongs_to :board
end
