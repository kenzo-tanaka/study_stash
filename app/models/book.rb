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
  validates :title, presence: true
  validates :url, format: { with: /\A#{URI.regexp(%w[http https])}\z/ }
  validates :image_url, format: { with: /\A#{URI.regexp(%w[http https])}\z/ }
end
