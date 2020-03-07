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

require 'rails_helper'

RSpec.describe ArticleBook, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
