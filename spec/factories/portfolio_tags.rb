# == Schema Information
#
# Table name: portfolio_tags
#
#  id           :bigint           not null, primary key
#  portfolio_id :bigint           not null
#  tag_id       :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :portfolio_tag do
    portfolio { nil }
    tag { nil }
  end
end
