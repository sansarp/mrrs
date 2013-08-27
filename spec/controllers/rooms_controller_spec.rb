require_relative '../spec_helper'

describe RoomsController do
	before(:each) do 
		@user = User.create!(
			email: 'connect.subash@gmail.com',
			password: 'password'
			)

		@newuser = User.create!(
				email: 'subash@gmail.com',
				password: 'wrongkkk'
			)
	end
it "should  allow room add for authenticated user" do
	login_as @user  
	@room = Room.new
	visit new_room_path 
end

it "should not allow room add for unauthenticated user" do
	login_as @newuser
	@room = Room.new
	visit new_room_path 
end
end
