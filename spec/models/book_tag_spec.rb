# == Schema Information
#
# Table name: book_tags
#
#  id         :bigint           not null, primary key
#  book_id    :bigint           not null
#  tag_id     :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe BookTag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
