class RenameReviewsColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :reviews, :review
  end
end
