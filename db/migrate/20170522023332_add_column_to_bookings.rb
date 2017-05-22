class AddColumnToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :landlord_email, :string
    rename_column :bookings, :email, :booker_email
  end
end
