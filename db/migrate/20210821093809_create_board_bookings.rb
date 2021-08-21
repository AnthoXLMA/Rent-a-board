class CreateBoardBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :board_bookings do |t|

      t.timestamps
    end
  end
end
