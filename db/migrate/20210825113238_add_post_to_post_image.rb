class AddPostToPostImage < ActiveRecord::Migration[5.2]
  def change
    change_table :spots do |t|
      t.references :post_image
    end
  end
end
