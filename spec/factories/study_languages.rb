# == Schema Information
#
# Table name: study_languages
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :study_language do
    sequence(:name) { |n| "ABC#{n}" }
  end
end
