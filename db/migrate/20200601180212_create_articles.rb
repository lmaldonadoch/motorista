class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.string :image
      t.integer :authorid

      t.timestamps
    end
  end
end
