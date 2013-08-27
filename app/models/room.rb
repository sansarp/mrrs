class Room < ActiveRecord::Base
	has_many :bookings
	validates :name, presence: :true
	validates :description, presence: :true
	validates :capacity, numericality: { only_integer: true,  
		message: "Please enter integer value." }
	# validates :status, presence: :true
end
