class ReservationsController < ApplicationController
	def create
		# byebug
		@user = User.find(params[:user_id])
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		@reservation.listing = @listing
		if @reservation.save
			flash[:notice] = "Successful reservation!"
			redirect_to current_user
			# byebug
		else
			flash[:errors] = @reservation.errors.full_messages
			redirect_to user_listing_path(@user, @listing)
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to @reservation.user
	end

	private

	def reservation_params
		params.require(:reservation).permit(:num_guests, :check_in, :check_out)
	end
end
