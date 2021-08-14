class AddColumnToBoards < ActiveRecord::Migration[6.0]
  def change
    add_reference :boards, :supplier, null: false, foreign_key: true
  end
end
