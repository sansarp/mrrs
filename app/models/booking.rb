class Booking < ActiveRecord::Base
  #validates :title, presence: :true
  validates :room_id, presence: :true
  validate :date_validate
  belongs_to :room
  belongs_to :user
  
def date_validate()
	
      #record.errors[:base] << "End time must be after the start time"
    if self.title.empty?
 	 	errors.add(:title, "Can't be blank for now")
 	end
 	#binding.pry
 	if Time.now.to_i - self.start_time.to_i >= 10*60
 		errors.add(:start_time,"you cant select the history time")    
    elsif self.start_time.to_i >= self.end_time.to_i  
    	errors.add(:start_time,"End time must be after the start time")
    else
    	boolking_overlap       
 	end
 	
end

def booking_overlap()
	bookings = Booking.all
	bookings.each do |booking|
		start = booking.start_time.to_i
		stop = booking.end_time.to_i
		#binding.pry
		if (self.start_time.to_i < stop && self.start_time.to_i > start) || (self.end_time.to_i < stop && self.end_time.to_i > start)
			errors.add(:start_time, "The room is booked from "+booking.start_time.to_s+" to "+booking.end_time.to_s)
		end
	end
end
end
