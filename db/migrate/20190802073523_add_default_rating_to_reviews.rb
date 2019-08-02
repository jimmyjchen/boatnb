class AddDefaultRatingToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rating, :integer, default: 0, null: false
  end
end
