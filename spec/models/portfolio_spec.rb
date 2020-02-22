# == Schema Information
#
# Table name: portfolios
#
#  id          :bigint           not null, primary key
#  title       :string
#  description :text
#  url         :string
#  ogp_url     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
