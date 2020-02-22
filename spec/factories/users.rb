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

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "sample#{n}@gmail.com" }
    password { 'password' }

    trait :admin do
      role { 'admin' }
    end
  end
end
