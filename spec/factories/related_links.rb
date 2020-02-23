# == Schema Information
#
# Table name: related_links
#
#  id           :bigint           not null, primary key
#  url          :string
#  title        :string
#  portfolio_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryBot.define do
  factory :related_link do
    url { "MyString" }
    title { "MyString" }
    portfolio { nil }
  end
end
