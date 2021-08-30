class AddOwnerIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :owner, null: false, foreign_key: true
  end
end