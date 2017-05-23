  date_format = '%Y-%m-%d'

  json.id booking.id
  json.booker_email booking.booker_email
  json.landlord_email booking.landlord_email
  json.state booking.state

  json.room_ref booking.room_ref
  json.start booking.start.strftime(date_format)
  json.end booking.end.strftime(date_format)
  json.title "Booked by Landlord" if (booking.state=='booked')&&(booking.booker_email==booking.landlord_email)
  json.title "Booked by "+booking.booker_email if (booking.state=='booked')&&(booking.booker_email!=booking.landlord_email)
  json.title "Change UI "+booking.booking.landlord_email if (booking.state=='requested')&&(booking.booker_email==booking.landlord_email)
  json.title "Requested by "+booking.booker_email if (booking.state=='requested')&&(booking.booker_email!=booking.landlord_email)
  json.title "Change UI "+booking.landlord_email if (booking.state=='rejected')&&(booking.booker_email==booking.landlord_email)
  json.title "Rejected "+booking.booker_email if (booking.state=='rejected')&&(booking.booker_email!=booking.landlord_email)

  json.update_url booking_path(booking, method: :patch)
  json.edit_url edit_booking_path(booking)
