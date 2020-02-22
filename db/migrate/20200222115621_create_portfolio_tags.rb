class CreatePortfolioTags < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolio_tags do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
