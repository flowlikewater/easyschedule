class AddColumnToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :state, :string
  end
end
