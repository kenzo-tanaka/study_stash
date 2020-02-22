class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.string :title
      t.text :description
      t.string :url
      t.string :ogp_url

      t.timestamps
    end
  end
end
