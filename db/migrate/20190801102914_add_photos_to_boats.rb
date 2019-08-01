class AddPhotosToBoats < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :photo_1, :string
    add_column :boats, :photo_2, :string
    add_column :boats, :photo_3, :string
  end
end
