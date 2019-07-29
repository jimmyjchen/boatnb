class AddTitleToBoat < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :title, :string
  end
end
