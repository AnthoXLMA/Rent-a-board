class AddReferenceToOwners < ActiveRecord::Migration[6.0]
  def change
    add_reference :owners, :user, null: false, foreign_key: true
    add_reference :owners, :account, null: false, foreign_key: true
  end
end
