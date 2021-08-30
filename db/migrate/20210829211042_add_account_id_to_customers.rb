class AddAccountIdToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_reference :customers, :account, null: false, foreign_key: true
  end
end
