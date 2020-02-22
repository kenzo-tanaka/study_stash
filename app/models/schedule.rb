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

class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :study_language

  scope :this_week_studytime_sorted, -> {
    includes(:user, :study_language)
      .where(created_at: Date.yesterday.beginning_of_week..Date.today.end_of_week)
      .order(study_time: :desc)
  }

  scope :pie_chart_static, -> {
    joins(:study_language).group(:name).sum(:study_time)
  }

  scope :area_chart_static, -> {
    group_by_day(:starttime).sum(:study_time)
  }

  scope :to_this_starttime, -> (this_starttime) {
    where(["starttime <= ?", this_starttime])
  }

  validates :title, :starttime, :endtime, presence: :true
  validate :check_start_end_time

  def check_start_end_time
    return if starttime.nil? || endtime.nil?
    errors.add(:starttime, 'は終了時刻よりも未来に設定できません。') if starttime >= endtime
  end

  before_save :calc_study_time
  def calc_study_time
    self.study_time = (endtime - starttime) / 60
  end
end
