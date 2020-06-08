class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :article_categories do |t|

      t.timestamps
      t.integer :articleid
      t.integer :category_id
    end
  end
end
