class Booking < ApplicationRecord
  validates :email, presence: true
  attr_accessor :date_range

end
