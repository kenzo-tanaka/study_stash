# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  user_id          :bigint           not null
#  content          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  commentable_type :string
#  commentable_id   :bigint
#

FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user
  end
end
