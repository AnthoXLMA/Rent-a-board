class AddShapeColumnToBoards < ActiveRecord::Migration[6.0]
  def change
    add_column :boards, :shape, :string
    add_column :boards, :guarantee_amount, :integer
  end
end
