class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
	    # You need to implement the method below in your model (e.g. app/models/user.rb)
	    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
	    # binding.pry
	    checkmail = @user.email
    	if checkmail.present? and not checkmail.match( /\A([^@\s]+)@lftechnology.com\Z/) ==false
     		checkmail = false
     	end
     	 # binding.pry
	    if @user.persisted? and checkmail == true
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	      sign_in_and_redirect @user, :event => :authentication
	      # binding.pry
	    else
	      session["devise.google_data"] = request.env["omniauth.auth"]
	      redirect_to root_path and return
	    end
	end
end