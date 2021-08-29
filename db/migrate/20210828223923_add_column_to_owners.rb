class AddColumnToOwners < ActiveRecord::Migration[6.0]
  def change
    add_column :owners, :email, :string
    add_column :owners, :password, :string
    add_column :owners, :phone_number, :string
  end
end
