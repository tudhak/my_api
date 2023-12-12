class AddReferencesToReservationsAndBookings < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :listing, null: false, foreign_key: true
    add_reference :reservations, :listing, null: false, foreign_key: true
  end
end
