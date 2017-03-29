class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :check_overlapping_dates
  validates :check_max_guests

  def check_overlapping_dates
  	# compare this new reservation againsts existing reservations
  	listing.reservations.each do |old_reservation|
  		if overlap?(self, old_reservation)
  			return errors.add(:overlapping_dates, "The booking dates conflict with existing bookings.")
  		end
  	end
  end

  def overlap?(x, y)
  	(x.check_in - y.check_out) * (y.check_in - x.check_out) > 0
  end

  def check_max_guests
  	max_guests = listing.no_of_guest
  	return if num_guests < no_of_guest
  	errors.add(:max_guests, "Max guests number exceeded!")
  end

end
