# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string
#  uid                    :string
#  name                   :string
#  icon                   :string
#  role                   :integer          default(NULL)
#

class User < ApplicationRecord
  enum role: { normal: 1, admin: 2 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  has_many :schedules, dependent: :destroy

  scope :most_studies_users, lambda {
    joins(:schedules)
      .where(schedules: {
        starttime: Date.yesterday.beginning_of_week..Date.today.end_of_week })
      .order('schedules.study_time desc').uniq
  }

  protected

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    user ||= User.create(name: auth.info.name,
                         email: User.dummy_email(auth),
                         provider: auth.provider,
                         uid: auth.uid,
                         icon: auth.info.image,
                         password: Devise.friendly_token[0, 20])
    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
