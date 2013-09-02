class SessionsController < Devise::SessionsController

  def new

  	@rooms = Room.all
    @croom = []
    counter = 0
    @rooms.each do |room|
      @croom[room.id] = Booking.where(:room_id => room.id).where("end_time > ?",Time.now).order('created_at DESC')
      #@croom[room.id] = Booking.where(:room_id => room.id).order('created_at DESC')
      counter +=1
    end
  	# binding.pry
    # add custom logic here
    # @room1 = Booking.where(:room_id => 1).order('created_at DESC') 
    # @room2 = Booking.where(:room_id => 2).order('created_at DESC') 
    # @room3 = Booking.where(:room_id => 3).order('created_at DESC') 
    # @room4 = Booking.where(:room_id => 4).order('created_at DESC') 

    super
  end

end 