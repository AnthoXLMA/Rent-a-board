class AddReferencesToBoardBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :board_bookings, :board, null: false, foreign_key: true
    add_reference :board_bookings, :booking, null: false, foreign_key: true
  end
end
