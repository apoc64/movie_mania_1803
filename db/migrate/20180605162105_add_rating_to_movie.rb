class AddRatingToMovie < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :rating, :integer, default: 0
  end
end