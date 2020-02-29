# == Schema Information
#
# Table name: blogs
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blog < ApplicationRecord
  belongs_to :user
end
