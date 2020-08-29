class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.integer :size
      t.string :brand
      t.integer :price
      t.string :contact

      t.timestamps
    end
  end
end
