class CreateRelatedLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :related_links do |t|
      t.string :url
      t.string :title
      t.references :portfolio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
