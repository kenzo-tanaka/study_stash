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

FactoryBot.define do
  factory :article_book do
    article { nil }
    book { nil }
  end
end
