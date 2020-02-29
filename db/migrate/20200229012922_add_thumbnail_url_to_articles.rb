class AddThumbnailUrlToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :thumbnail_url, :string
  end
end
