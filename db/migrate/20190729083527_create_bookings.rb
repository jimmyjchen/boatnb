class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :date_start
      t.datetime :date_end
      t.references :boat, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
