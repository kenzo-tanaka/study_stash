class AddOgpUrlToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :ogp_url, :string
  end
end
