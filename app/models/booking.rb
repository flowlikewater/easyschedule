class Booking < ApplicationRecord
  validates :booker_email, presence: true
  validates :landlord_email, presence: true
  validates :room_ref, presence: true

  attr_accessor :date_range

end
