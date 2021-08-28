class AddAvailabilityColumnToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :availability, :string
  end
end
