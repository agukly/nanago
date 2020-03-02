class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :start_day
      t.date :end_day
      t.integer :total_price
      t.references :pram, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
