class SessionsController < Devise::SessionsController

  def new
  	# binding.pry
    # add custom logic here
    @room1 = Booking.where(:room_id => 1).order('created_at DESC') 
    @room2 = Booking.where(:room_id => 2).order('created_at DESC') 

    super
  end

end 