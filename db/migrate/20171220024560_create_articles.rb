class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      
      t.string :keyword
      t.string :eyecatch
      t.string :title
      t.text :content
      t.text :slideshare_embed
      t.string :movie
      t.text :bibilography
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
