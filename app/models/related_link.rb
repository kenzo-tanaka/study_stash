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

class RelatedLink < ApplicationRecord
  belongs_to :portfolio
end
