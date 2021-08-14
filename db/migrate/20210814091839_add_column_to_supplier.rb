class AddColumnToSupplier < ActiveRecord::Migration[6.0]
  def change
    add_column :suppliers, :name, :string
    add_column :suppliers, :contact, :string
  end
end
