class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.string :room_ref
      t.date :date
      t.string :email
      t.timestamps
    end
  end
end
