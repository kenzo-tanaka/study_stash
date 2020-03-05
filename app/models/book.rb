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

class Book < ApplicationRecord
  has_many :book_tags, dependent: :destroy
  has_many :tags, through: :book_tags
  has_many :comments, as: :commentable
  has_many :article_books, dependent: :destroy
  has_many :articles, through: :article_books

  scope :latest, -> { order(created_at: :desc) }

  validates :title, presence: true
  validates :url, format: { with: /\A#{URI.regexp(%w[http https])}\z/ }
  validates :image_url, format: { with: /\A#{URI.regexp(%w[http https])}\z/ }
end
