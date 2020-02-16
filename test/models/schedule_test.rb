# == Schema Information
#
# Table name: schedules
#
#  id                :bigint           not null, primary key
#  title             :string           not null
#  memo              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  starttime         :datetime         not null
#  endtime           :datetime         not null
#  study_time        :integer
#  user_id           :bigint           not null
#  study_language_id :bigint           not null
#

require 'test_helper'

class ScheduleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
