class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_on
      t.datetime :end_on
      t.integer :total_price

      t.timestamps
    end
  end
end
