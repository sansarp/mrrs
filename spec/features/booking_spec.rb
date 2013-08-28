require_relative '../spec_helper'

describe "Booking is done for" do
	before(:each) do 
		@user = User.create!(
			email: 'connect.subash@gmail.com',
			password: 'password'
			)
	end
it "should  allow room add for authenticated user" do
	login_as @user  
	@room = Room.new
	visit new_room_path 
end
end
