class ChangeDescriptionNameForBoat < ActiveRecord::Migration[5.2]
  def change
    rename_column :boats, :discription, :description
  end
end
