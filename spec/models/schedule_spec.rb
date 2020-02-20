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