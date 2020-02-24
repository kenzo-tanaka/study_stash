# == Schema Information
#
# Table name: portfolios
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  url         :string
#  ogp_url     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :portfolio do
    title { "MyString" }
    description { "MyText" }
    url { "https://www.doya.life/" }
    ogp_url { "https://www.doya.life/" }
  end
end
