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
#

class Article < ApplicationRecord
  belongs_to :blog
  has_many :book_articles, dependent: :destroy
  has_many :books, through: :book_articles
end
