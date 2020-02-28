# == Schema Information
#
# Table name: tags
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ogp_url     :string
#

class Tag < ApplicationRecord
  has_many :portfolio_tags, dependet: :destroy
  has_many :portfolios, through: :portfolio_tags
  has_many :book_tags, dependetn: :destory
  has_many :books, through: :book_tags

  scope :has_portfolios, lambda {
    joins(:portfolios)
    .distinct
  }
end
