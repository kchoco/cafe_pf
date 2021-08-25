class AddTagListToPostImage < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :tag_list, :integer
  end
end
