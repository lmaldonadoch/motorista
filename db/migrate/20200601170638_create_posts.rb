class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.string :image
      t.integer :authorid

      t.timestamps
    end
  end
end
