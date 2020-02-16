class AddStarttimeAndEndtimeToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :starttime, :datetime, null: false
    add_column :schedules, :endtime, :datetime, null: false
  end
end
