class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :category
      t.string :post
      t.string :author
      t.string "img", default: "no_image.jpg"
      t.timestamps
    end
  end
end
