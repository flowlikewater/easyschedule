class Booking < ApplicationRecord
  validates :booker_email, presence: true
  validates :landlord_email, presence: true
  validates :room_ref, presence: true

  attr_accessor :date_range

  STATES = %w{ requested rejected booked }

  STATES.each do |state|
    define_method("#{state}?") do
      self.state == state
    end

    define_method("#{state}!") do
      self.update_attribute(:state, state)
    end
  end

end
