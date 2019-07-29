class CreateBoats < ActiveRecord::Migration[5.2]
  def change
    create_table :boats do |t|
      t.integer :price
      t.string :discription
      t.boolean :available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
