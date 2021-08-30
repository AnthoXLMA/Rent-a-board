class AddIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :account, foreign_key: true
  end
end
