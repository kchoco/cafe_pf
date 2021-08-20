class AddEvaluationToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :evaluation, :float
  end
end
