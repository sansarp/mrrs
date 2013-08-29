class BookingsController < ApplicationController
	before_filter :authenticate_user!
	before_action :set_booking, only: [:edit, :update, :destroy]
	before_action :validate_booking, olny: [:create, :update]
	def index
		@bookings = current_user.admin? ? Booking.all : Booking.find_all_by_user_id(current_user)
		#binding.pry
	end
	def new
		@booking = Booking.new
	end
	def create
		@booking = current_user.bookings.build(booking_params)
		if @booking.save
			redirect_to '/', notice: 'Room booked !!!'
		else
			#redirect_to new_booking_path, alert: 'something'
			render 'new', alert: 'something'
		end
	end
	def edit
	end
	def update
		# binding.pry
		if @booking.update(booking_params)
			redirect_to '/', notice: 'Booking successfully edited !!!'
		end
	end
	def destroy
		if @booking.destroy
			redirect_to '/', notice: 'Booking cancelled !!'
		end
	end

	private
	def validate_booking
		
	end
	def set_booking
      @booking ||= Booking.find(params[:id])
    end

	def booking_params
		params.require(:booking).permit(:title, :description, :start_time, :end_time, :room_id)
	end
end
