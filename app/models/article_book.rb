# == Schema Information
#
# Table name: article_books
#
#  id         :bigint           not null, primary key
#  article_id :bigint           not null
#  book_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleBook < ApplicationRecord
  belongs_to :article
  belongs_to :book
end
