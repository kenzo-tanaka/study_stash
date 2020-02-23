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

class Tag < ApplicationRecord
  has_many :portfolio_tags
  has_many :portfolios, through: :portfolio_tags

  scope :has_portfolios, lambda {
    joins(:portfolios)
  }
end
