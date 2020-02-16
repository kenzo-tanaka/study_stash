class AddStudyLanguageReferencesToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_reference :schedules, :study_language, null: false, foreign_key: true
  end
end
