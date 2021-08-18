class AddProfileImageToUses < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_image_id, :string
    add_column :users, :profile, :text
    add_column :users, :is_valid, :boolean, default: true, null: false
  end
end
