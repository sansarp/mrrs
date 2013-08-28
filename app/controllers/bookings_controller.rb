class BookingsController < ApplicationController
	before_filter :authenticate_user!
	def index
		@bookings = current_user.admin? ? Booking.all : Booking.find_all_by_user_id(current_user)
		#binding.pry
	end
	def show
	end
end
