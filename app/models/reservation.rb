class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  # validate :check_overlapping_dates
  # validate :check_max_guests
  # validate num_guests is not negative
  # validate check_in date should be after today

  def check_overlapping_dates
  	# compare this new reservation againsts existing reservations
  	listing.reservations.each do |old_reservation|
  		if overlap?(self, old_reservation)
  			return errors.add(:overlapping_dates, "The booking dates conflict with existing bookings.")
  		end
  	end
  end

  def overlap?(x, y)
  	# byebug
  	(x.check_in - y.check_out) * (y.check_in - x.check_out) > 0
  end

  def check_max_guests
  	max_guests = listing.no_of_guest
  	return if num_guests < max_guests
  	errors.add(:max_guests, "Max guests number exceeded!")
  end

  def total_price
  	price = listing.price
  	num_dates = (check_in..check_out).to_a.length
  	return price * num_dates
  end


end
