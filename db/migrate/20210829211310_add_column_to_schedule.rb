class AddColumnToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :title, :string
    add_column :schedules, :start, :datetime
    add_column :schedules, :end, :datetime
    add_column :schedules, :owner_id, :integer
    add_index :schedules, :owner_id
  end
end
