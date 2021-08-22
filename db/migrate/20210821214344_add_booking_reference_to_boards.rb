class AddBookingReferenceToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :booking, null: true, foreign_key: true
  end
end
