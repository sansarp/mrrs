require_relative '../spec_helper'

describe "Check for duplicate user" do
	it "is invalid when email is not unique" do
		@user = User.create!(
			email: 'connect.subash@gmail.com',
			password: 'password'
			)

		@user1 = User.create!(
			email: 'connect.subash@gmail.com',
			password: 'password'
			)
	end

	it "is valid when email is unique" do 
		@user = User.create!(
			email: 'connect.subash@gmail.com',
			password: 'password'
			)

		@user1 = User.create!(
			email: 'subash.subash@gmail.com',
			password: 'password'
			)
	end
end