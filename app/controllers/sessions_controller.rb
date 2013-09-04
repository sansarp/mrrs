class SessionsController < Devise::SessionsController
  def new
    @rooms = Room.all
    @croom = []
    @rooms.each do |room|
      @croom[room.id] = Booking.where(:room_id => room.id).where("end_time > ?",Time.now).order('created_at DESC')
    end
    super
  end
end 