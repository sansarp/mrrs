class RemoveBookingStatusFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :booking_status, :boolean
  end
end
