require_relative '../spec_helper'

describe "Booking" do
	before(:each) do 
		@user = User.create!(
			email: 'connect.subash@gmail.com',
			password: 'password'
			)
	end
it "should  allow room booking for authenticated user" do
	login_as @user  
	@booking = Booking.new
	visit  new_booking_path  

	fill_in 'Title', with: 'ROR meetup'
	fill_in 'Description', with: 'weekly meeting'
	
	select("2013", :from => "booking_start_time_1i")
	select("October", :from => "booking_start_time_2i")
	select("10", :from => "booking_start_time_3i")
	select("09", :from => "booking_start_time_4i")
	select("02", :from => "booking_start_time_5i")

	select("2013", :from => "booking_end_time_1i")
	select("October", :from => "booking_end_time_2i")
	select("10", :from => "booking_end_time_3i")
	select("10", :from => "booking_end_time_4i")
	select("02", :from => "booking_end_time_5i")
	# select 'October' from => 'booking_start_time_2i'
	# select '10' :from => 'booking_start_time_3i'
	# select '09' :from => 'booking_start_time_4i'
	# select '02' :from => 'booking_start_time_5i'

	# select '2013' :from => 'booking_end_time_1i'
	# select 'October' :from => 'booking_end_time_2i'
	# select '11' :from => 'booking_end_time_3i'
	# select '09' :from => 'booking_end_time_4i'
	# select '02' :from => 'booking_end_time_5i'
	
	click_button 'Save'
	expect(page).to have_content 'Room booked !!!'
	save_and_open_page
	end
end