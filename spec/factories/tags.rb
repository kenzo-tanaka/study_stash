# == Schema Information
#
# Table name: tags
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :tag do
    name { "MyString" }
    description { "MyText" }
  end
end
