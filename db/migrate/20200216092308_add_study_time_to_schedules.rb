class AddStudyTimeToSchedules < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :study_time, :integer
  end
end
