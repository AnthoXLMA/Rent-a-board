class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_on
      t.datetime :end_on
      t.integer :total_price
      t.string :status

      t.timestamps
    end
  end
end
