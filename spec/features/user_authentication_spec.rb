require_relative '../spec_helper'

describe "User signin", :type=> :features do 
	# before :each do
 #    	User.create(:email => 'connect.subash@gmail.com', :password => 'password')
 #  	end
	it "requires the user to signup first" do
		visit '/users/sign_up'
		fill_in 'Name', with: 'Subash'
		fill_in 'Position', with: 'SE'
		fill_in 'Email', with: 'test@gmail.com'
		fill_in 'Password', with: 'password'
		fill_in 'user_password_confirmation', with: 'password'
		
		click_button 'Sign up'
		save_and_open_page
		expect(page).to have_content 'You need to sign in or sign up before continuing.'
	end
end