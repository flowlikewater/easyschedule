json.array! @bookings do |booking|
  date_format = '%Y-%m-%d'

  json.id booking.id
  json.booker_email booking.booker_email
  json.landlord_email booking.landlord_email

  json.room_ref booking.room_ref
  json.start booking.start.strftime(date_format)
  json.end booking.end.strftime(date_format)
  json.title (booking.booker_email==booking.landlord_email)? "Booked by Landlord" : "Booked by Tenant"
  json.backgroundColor (booking.booker_email==booking.landlord_email)? 'rgb(251, 50, 50)' : 'rgb(33, 8, 235)'

  json.update_url booking_path(booking, method: :patch)
  json.edit_url edit_booking_path(booking)
end
