require_relative '../spec_helper'

describe "Room creation" do
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

	fill_in 'Name', with: 'Room 1'
	fill_in 'Description', with: 'vip meeting room'
	fill_in 'Capacity', with: '8'
	# fill_in checkbox 'Status', with: '1'
	choose('room_status_true')
	click_button 'Save'
	expect(page).to have_content 'Room was successfully created.'
	save_and_open_page
	end
end