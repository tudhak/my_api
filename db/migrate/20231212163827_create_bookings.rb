class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :end_date
      t.date :start_date

      t.timestamps
    end
  end
end
