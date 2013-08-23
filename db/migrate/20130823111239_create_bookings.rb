class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.text :description
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :booking_status
      t.references :room, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
