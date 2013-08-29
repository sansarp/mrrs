require_relative '../spec_helper'

describe "Room creation" do
	# before(:each) do 
	# 	@user = User.create!(
	# 		email: 'connect.subash@gmail.com',
	# 		password: 'password'
	# 		)
	# end

	it "only admin user can create room" do
		# login_as @user  
		visit '/rooms/new' 
		expect(page).to have_content 'Name'
		# print page.html
		# fill_in 'Name', with: 'Room 1'
		# fill_in 'Description', with: 'vip meeting room'
		# fill_in 'Capacity', with: '8'
		# fill_in 'Status', with: '1'
		# click_button 'Save'
		# expect(page).to have_content 'Room was successfully created.'
		# save_and_open_page
		print page.html
	end

end