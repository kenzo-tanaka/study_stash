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

class Article < ApplicationRecord
  belongs_to :blog
  has_many :article_books, dependent: :destroy
  has_many :books, through: :article_books
end
