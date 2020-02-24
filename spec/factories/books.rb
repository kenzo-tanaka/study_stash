# == Schema Information
#
# Table name: books
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  image_url   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  url         :string
#

FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyText" }
    image_url { "MyString" }
  end
end
