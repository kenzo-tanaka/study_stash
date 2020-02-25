# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :user
end