# == Schema Information
#
# Table name: articles
#
#  id            :bigint           not null, primary key
#  title         :string           not null
#  content       :text             not null
#  blog_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  thumbnail_url :string
#  description   :text
#

FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
  end
end
