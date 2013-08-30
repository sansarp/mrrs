class RoomsController < ApplicationController
 before_filter :authenticate_user!
 before_action :set_room, only: [:edit, :update, :destroy]

  def index
  	@rooms = Room.all
  end

  def new
  	@room = Room.new
  end

  def create
  	 @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to  rooms_path(@room), notice: 'Room was successfully created.' }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def add
  end

  def edit
     @room = Room.find params[:id]
  #    binding.pry
  end

  def update
    @room = Room.find(params[:id])
    # binding.pry
    respond_to do |format|
      if @room .update_attributes(room_params)
        format.html { redirect_to  rooms_path, notice: 'Room was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:success] = "Room and its associated bookings deleted."
    redirect_to rooms_path
  end

  def dashboard
    @room1 = Booking.where(:room_id => 1).order('created_at DESC') 
    @room2 = Booking.where(:room_id => 2).order('created_at DESC') 
    @room3 = Booking.where(:room_id => 3).order('created_at DESC') 
    @room4 = Booking.where(:room_id => 4).order('created_at DESC')
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room ||= Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :description, :capacity, :status)
    end
end
