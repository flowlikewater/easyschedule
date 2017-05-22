json.array! @bookings do |booking|
  date_format = '%Y-%m-%d'

  json.id booking.id
  json.booker_email booking.booker_email
  json.landlord_email booking.landlord_email

  json.room_ref booking.room_ref
  json.start booking.start.strftime(date_format)
  json.end booking.end.strftime(date_format)
  json.title (booking.booker_email==booking.landlord_email)? "Booked by Landlord" : "Booked by "+ booking.booker_email
  json.backgroundColor (booking.booker_email==booking.landlord_email)? 'rgb(1, 28, 168)' : 'rgb(44, 207, 40)'
  json.selectOverlap false
  json.overlap false

  json.update_url booking_path(booking, method: :patch)
  json.edit_url edit_booking_path(booking)
end

json.array! @requests do |request|
  date_format = '%Y-%m-%d'

  json.id request.id
  json.booker_email request.booker_email
  json.landlord_email request.landlord_email

  json.room_ref request.room_ref
  json.start request.start.strftime(date_format)
  json.end request.end.strftime(date_format)
  json.title "Requested by "+ request.booker_email
  json.backgroundColor 'rgba(255, 184, 0, 0.74)'
  json.overlap true
  json.selectOverlap false

  json.update_url booking_path(request, method: :patch)
  json.edit_url edit_booking_path(request)
end
