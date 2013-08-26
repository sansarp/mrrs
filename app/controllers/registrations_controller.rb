class RegistrationsController < Devise::RegistrationsController
	def new
		@user = User.new
	end
	def create
		@user = current_user.users.build
		binding.pry
		@user.admin = 0
		#@user.save
	end
end
