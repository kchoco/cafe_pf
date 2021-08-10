class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.integer :user_id
      t.text :title
      t.text :introduction
      t.float :rate
      t.string :image_id

      t.timestamps
    end
  end
end
