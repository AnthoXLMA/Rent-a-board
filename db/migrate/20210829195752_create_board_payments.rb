class CreateBoardPayments < ActiveRecord::Migration[6.0]
  def change
    create_table :board_payments do |t|
      t.string :payment_number
      t.string :status
      t.date :date
      t.integer :cost
      t.string :service
      t.integer :booking_id
      t.integer :account_id

      t.timestamps
    end
    add_index :board_payments, :booking_id
    add_index :board_payments, :account_id
  end
end
