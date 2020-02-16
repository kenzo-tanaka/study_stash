# == Schema Information
#
# Table name: schedules
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  memo       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  starttime  :datetime         not null
#  endtime    :datetime         not null
#  study_time :integer
#  user_id    :bigint           not null
#

class Schedule < ApplicationRecord
  belongs_to :user

  before_save :calc_study_time
  def calc_study_time
    self.study_time = (endtime - starttime) / 60
  end
end
