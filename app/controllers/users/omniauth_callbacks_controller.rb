class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
	def google_oauth2
	    # You need to implement the method below in your model (e.g. app/models/user.rb)
	    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
	    # binding.pry
	    checkmail = @user.email
    	if checkmail.present? and not checkmail.match( /\A([^@\s]+)@lftechnology.com\Z/) 
     		checkmail = false
     	else
     		checkmail = true
     	end
     	    # binding.pry
	    if @user.persisted? and checkmail 
	      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
	      sign_in_and_redirect @user, :event => :authentication
	    else
	       # session["devise.google_data"] = request.env["omniauth.auth"]
	       flash[:error] = I18n.t 'devise.omniauth_callbacks.failure', 
	            :kind => 'Google', :reason => 'only @lftechnology domain is allowed'
	      redirect_to root_path 
	      # binding.pry
	    end
	end
end