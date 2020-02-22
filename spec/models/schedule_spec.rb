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

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "check_start_end_time" do
    let(:schedule) { build(:schedule, starttime: Time.zone.now, endtime: Time.zone.now - 1.hour) }
    subject { schedule.check_start_end_time }
    it 'エラーを返す' do
      schedule.valid?
      expect(schedule.errors[:starttime]).to include('は終了時刻よりも未来に設定できません。')
    end
  end
end
