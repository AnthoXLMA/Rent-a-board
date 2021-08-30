class AddCustomerIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :customer, null: false, foreign_key: true
  end
end
