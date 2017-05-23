json.array! @bookings do |booking|
  date_format = '%Y-%m-%d'

  json.id booking.id
  json.booker_email booking.booker_email
  json.landlord_email booking.landlord_email
  json.state booking.state

  json.room_ref booking.room_ref
  json.start booking.start_date.strftime(date_format)
  json.end booking.end_date.strftime(date_format)
  json.title (booking.booker_email==booking.landlord_email)? "Booked by Landlord" : "Booked by "+ booking.booker_email
  json.backgroundColor (booking.booker_email==booking.landlord_email)? 'rgb(1, 28, 168)' : 'rgb(44, 207, 40)'


  json.update_url booking_path(booking, method: :patch)
  json.edit_url edit_booking_path(booking)
end

json.array! @requests do |request|
  date_format = '%Y-%m-%d'

  json.id request.id
  json.booker_email request.booker_email
  json.landlord_email request.landlord_email
  json.state request.state

  json.room_ref request.room_ref
  json.start request.start_date.strftime(date_format)
  json.end request.end_date.strftime(date_format)
  json.title "Requested by "+ request.booker_email + " $" + (((session[:price]/30)*(request.end_date-request.start_date)).to_f).to_s
  json.backgroundColor 'rgba(255, 184, 0, 0.74)'


  json.update_url booking_path(request, method: :patch)
  json.edit_url edit_booking_path(request)
end

json.array! @rejections do |reject|
  date_format = '%Y-%m-%d'

  json.id reject.id
  json.booker_email reject.booker_email
  json.landlord_email reject.landlord_email
  json.state reject.state

  json.room_ref reject.room_ref
  json.start reject.start_date.strftime(date_format)
  json.end reject.end_date.strftime(date_format)
  json.title "Rejected "+ reject.booker_email
  json.backgroundColor 'rgba(145, 145, 145, 0.86)'
  json.eventStartEditable false


  json.update_url booking_path(reject, method: :patch)
  json.edit_url edit_booking_path(reject)
end
