class SessionsController < Devise::SessionsController

  def new
  	# binding.pry
    # add custom logic here
    @rooms = Room.all 
    super
  end

end 